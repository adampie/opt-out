{
  name = "hasura";
  meta = {
    description = "Hasura GraphQL Engine";
    homepage = "https://github.com/hasura/graphql-engine";
    documentation = "https://hasura.io/docs/latest/policies/telemetry/";
    lastChecked = "2026-08-01";
    hasTelemetry = true;
  };
  variables = {
    HASURA_GRAPHQL_ENABLE_TELEMETRY = "false";
  };
  commands = { };
  config = { };
}
