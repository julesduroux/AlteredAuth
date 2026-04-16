// One-shot cleanup: turn the raw prod export into a dev seed.
// Run: node dev/clean.js
const fs = require("fs");
const path = require("path");

const INPUT = path.join(__dirname, "realm-export-raw.json");
const OUTPUT = path.join(__dirname, "realm-export.json");

const BUILTIN_CLIENTS = new Set([
  "account",
  "account-console",
  "admin-cli",
  "broker",
  "realm-management",
  "security-admin-console",
]);

const TEST_USERS = [
  {
    username: "alice",
    email: "alice@example.test",
    firstName: "Alice",
    lastName: "Tester",
    enabled: true,
    emailVerified: true,
    credentials: [{ type: "password", value: "TestPassword1234", temporary: false }],
  },
  {
    username: "bob",
    email: "bob@example.test",
    firstName: "Bob",
    lastName: "Tester",
    enabled: true,
    emailVerified: true,
    credentials: [{ type: "password", value: "TestPassword1234", temporary: false }],
  },
];

// Recursively strip every "id" field so Keycloak regenerates fresh UUIDs on import.
function stripIds(node) {
  if (Array.isArray(node)) return node.map(stripIds);
  if (node && typeof node === "object") {
    const out = {};
    for (const [k, v] of Object.entries(node)) {
      if (k === "id" || k === "containerId") continue;
      out[k] = stripIds(v);
    }
    return out;
  }
  return node;
}

const raw = JSON.parse(fs.readFileSync(INPUT, "utf8"));

// Drop built-in clients (Keycloak recreates them at import).
raw.clients = (raw.clients || []).filter((c) => !BUILTIN_CLIENTS.has(c.clientId));

// Drop built-in auth flows & authenticator configs (also recreated).
raw.authenticationFlows = (raw.authenticationFlows || []).filter((f) => !f.builtIn);
if (raw.authenticationFlows.length === 0) delete raw.authenticationFlows;
delete raw.authenticatorConfig;

// Drop role definitions for builtin clients — they were tied to realm-management etc.
if (raw.roles && raw.roles.client) {
  for (const name of BUILTIN_CLIENTS) delete raw.roles.client[name];
}

// clientScopeMappings on this realm only bind builtin scopes/clients — drop it.
delete raw.clientScopeMappings;

// No SMTP in dev (no real mail server, no leaking prod provider).
delete raw.smtpServer;

// Dev default: skip email verification so register flow works without SMTP.
raw.verifyEmail = false;

// Seed two pre-verified test users.
raw.users = [...(raw.users || []), ...TEST_USERS];

const cleaned = stripIds(raw);

fs.writeFileSync(OUTPUT, JSON.stringify(cleaned, null, 2) + "\n");
console.log(`Wrote ${OUTPUT} (${fs.statSync(OUTPUT).size} bytes)`);
