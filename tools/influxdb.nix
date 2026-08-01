{
  name = "influxdb";
  meta = {
    description = "InfluxDB time series database";
    homepage = "https://github.com/influxdata/influxdb";
    documentation = "https://docs.influxdata.com/influxdb/v2/reference/config-options/";
    lastChecked = "2026-08-01";
    hasTelemetry = true;
  };
  variables = {
    INFLUXD_REPORTING_DISABLED = "true";
  };
  commands = { };
  config = { };
}
