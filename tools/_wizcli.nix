{
  name = "wizcli";
  meta = {
    description = "Command-line scanner for the Wiz cloud security platform";
    homepage = "https://www.wiz.io/";
    documentation = "https://docs.wiz.io/docs/wizcli";
    lastChecked = "2026-08-01";
    hasTelemetry = true;
  };
  variables = { };
  commands = {
    disable = "wizcli iac scan --no-telemetry";
  };
  config = { };
}
