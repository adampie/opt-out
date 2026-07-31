{
  name = "steampipe";
  meta = {
    description = "Steampipe universal interface to APIs using SQL";
    homepage = "https://github.com/turbot/steampipe";
    documentation = "https://steampipe.io/docs/reference/env-vars/steampipe_telemetry";
    lastChecked = "2026-03-29";
    hasTelemetry = true;
  };
  variables = {
    STEAMPIPE_TELEMETRY = "none";
  };
  commands = { };
  config = { };
}
