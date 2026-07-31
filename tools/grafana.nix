{
  name = "grafana";
  meta = {
    description = "Grafana open-source observability platform";
    homepage = "https://github.com/grafana/grafana";
    documentation = "https://grafana.com/docs/grafana/latest/setup-grafana/configure-grafana/";
    lastChecked = "2026-03-29";
    hasTelemetry = true;
  };
  variables = {
    GF_ANALYTICS_REPORTING_ENABLED = "false";
    GF_ANALYTICS_CHECK_FOR_UPDATES = "false";
    GF_ANALYTICS_CHECK_FOR_PLUGIN_UPDATES = "false";
  };
  commands = { };
  config = { };
}
