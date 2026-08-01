{
  name = "meilisearch";
  meta = {
    description = "Meilisearch open-source search engine";
    homepage = "https://github.com/meilisearch/meilisearch";
    documentation = "https://www.meilisearch.com/docs/learn/resources/telemetry";
    lastChecked = "2026-08-01";
    hasTelemetry = true;
  };
  variables = {
    MEILI_NO_ANALYTICS = "true";
  };
  commands = { };
  config = { };
}
