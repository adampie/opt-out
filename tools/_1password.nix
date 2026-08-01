{
  name = "1password";
  meta = {
    description = "Password manager desktop application";
    homepage = "https://1password.com";
    documentation = "https://support.1password.com/telemetry/";
    lastChecked = "2026-08-01";
    hasTelemetry = true;
  };
  variables = { };
  commands = { };
  config = {
    "Manage Account > Usage Data" = {
      "Share information about your usage across the 1Password apps" = "off";
    };
  };
}
