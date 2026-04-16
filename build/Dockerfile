# Dockerfile
ARG KEYCLOAK_VERSION=26.5.0

FROM quay.io/keycloak/keycloak:${KEYCLOAK_VERSION} AS builder
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true
ENV KC_DB=postgres
ENV KC_FEATURES=authorization,account,account-api,docker,web-authn,client-policies,ciba,par

WORKDIR /opt/keycloak
RUN /opt/keycloak/bin/kc.sh build

FROM quay.io/keycloak/keycloak:${KEYCLOAK_VERSION} AS final
COPY --from=builder /opt/keycloak/ /opt/keycloak/
COPY ./themes /opt/keycloak/themes

ENV KC_DB=postgres

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start", "--optimized"]
