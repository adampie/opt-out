{
  name = "coder";
  meta = {
    description = "Coder remote development platform";
    homepage = "https://github.com/coder/coder";
    documentation = "https://coder.com/docs/admin/setup/telemetry";
    lastChecked = "2026-08-01";
    hasTelemetry = true;
  };
  variables = {
    CODER_TELEMETRY_ENABLE = "false";
    CODER_DISABLE_NETWORK_TELEMETRY = "true";
  };
  commands = { };
  config = { };
}
