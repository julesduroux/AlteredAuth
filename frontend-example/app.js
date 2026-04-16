import Keycloak from "https://cdn.jsdelivr.net/npm/keycloak-js@26.0.6/lib/keycloak.js";

// Pick the backend this page authenticates against.
// - "prod":   shared prod Keycloak at auth.altered.re (default — use to wire a new app against the real realm)
// - "local":  local Keycloak started via `docker compose -f docker-compose.dev.yml up` (for theme dev)
// Override at runtime with ?backend=local or ?backend=prod on the URL.
const BACKEND = new URLSearchParams(location.search).get("backend") || "prod";

const KEYCLOAK_CONFIG = {
  local: { url: "http://localhost:8080",        realm: "players", clientId: "localhost-test" },
  prod:  { url: "https://auth.altered.re",      realm: "players", clientId: "localhost-test" },
};

const keycloak = new Keycloak(KEYCLOAK_CONFIG[BACKEND]);

const statusEl = document.getElementById("status");
const userInfoEl = document.getElementById("userInfo");
const idTokenEl = document.getElementById("idToken");
const accessTokenEl = document.getElementById("accessToken");

keycloak.onTokenExpired = () => {
  keycloak.updateToken(30)
    .then((refreshed) => {
      if (refreshed) {
        console.log("Token refreshed");
        render(true);
      }
    })
    .catch(() => {
      console.warn("Refresh failed, logging out");
      keycloak.login();
    });
};

keycloak
  .init({
    onLoad: "check-sso",
    pkceMethod: "S256",
    checkLoginIframe: false,
  })
  .then((authenticated) => {
    render(authenticated);
  })
  .catch((err) => {
    console.error("Keycloak init failed:", err);
    statusEl.textContent = "Init failed: " + JSON.stringify(err);
  });

document.getElementById("loginBtn").onclick = () => keycloak.login(
 /*optional scopes available for clientid localhost-test: 
 email (access the email of the user)
 read-deck (read access on the decks)
 read-collection (read access on the collection)
 
 optional scopes that can be available for other client ids (contact Altered Re:Union to activate them, it will require more security) 
 write-deck (write access on the decks)
 backup-collection (have access to the backup of the collection, even offline)
 */
{ scope: "read-collection email" });
document.getElementById("registerBtn").onclick = () => keycloak.register();
document.getElementById("logoutBtn").onclick = () => keycloak.logout();
document.getElementById("accountBtn").onclick = () =>
  keycloak.accountManagement();
document.getElementById("refreshBtn").onclick = () =>
  keycloak.updateToken(-1).then(() => render(true));

async function render(authenticated) {
  if (!authenticated) {
    statusEl.className = "status anonymous";
    statusEl.textContent = "Not authenticated";
    userInfoEl.textContent = "—";
    idTokenEl.textContent = "—";
    accessTokenEl.textContent = "—";
    return;
  }

  statusEl.className = "status authenticated";
  statusEl.textContent =
    "Authenticated as " +
    (keycloak.tokenParsed.preferred_username || keycloak.tokenParsed.email);

  idTokenEl.textContent = JSON.stringify(keycloak.idTokenParsed, null, 2);
  accessTokenEl.textContent = JSON.stringify(keycloak.tokenParsed, null, 2);

  try {
    const profile = await keycloak.loadUserProfile();
    userInfoEl.textContent = JSON.stringify(profile, null, 2);
  } catch (e) {
    userInfoEl.textContent = "Failed to load profile: " + e;
  }
}
