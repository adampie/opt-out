{
  name = "proxyman";
  meta = {
    description = "A macOS, Windows, and Linux HTTP debugging proxy for developers";
    homepage = "https://proxyman.com";
    documentation = "https://proxyman.com/privacy";
    lastChecked = "2026-08-01";
    hasTelemetry = true;
  };
  variables = { };
  commands = { };
  config = {
    "App Settings > Privacy" = {
      "Share analytics with Proxyman" = "off";
      "Share crashed reports with Proxyman" = "off";
    };
  };
}
