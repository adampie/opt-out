{
  name = "grafana";
  meta = {
    description = "Grafana open-source observability platform";
    homepage = "https://github.com/grafana/grafana";
    documentation = "https://grafana.com/docs/grafana/latest/setup-grafana/configure-grafana/";
    lastChecked = "2026-02-22";
    hasTelemetry = true;
  };
  variables = {
    GF_ANALYTICS_REPORTING_ENABLED = "false";
  };
  commands = { };
}
