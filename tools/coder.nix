{
  name = "coder";
  meta = {
    description = "Coder remote development platform";
    homepage = "https://github.com/coder/coder";
    documentation = "https://coder.com/docs/admin/setup/telemetry";
    lastChecked = "2026-02-22";
    hasTelemetry = true;
  };
  variables = {
    CODER_TELEMETRY_ENABLE = "false";
  };
  commands = { };
}
