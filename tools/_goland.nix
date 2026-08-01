{
  name = "goland";
  meta = {
    description = "JetBrains GoLand Go IDE";
    homepage = "https://www.jetbrains.com/go/";
    documentation = "https://www.jetbrains.com/help/go/settings-usage-statistics.html";
    lastChecked = "2026-08-01";
    hasTelemetry = true;
  };
  variables = { };
  commands = { };
  config = {
    "Settings > Appearance & Behavior > System Settings > Data Sharing" = {
      "Send anonymous usage statistics" = "off";
    };
  };
}
