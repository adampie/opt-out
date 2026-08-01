{
  name = "datagrip";
  meta = {
    description = "JetBrains DataGrip database IDE";
    homepage = "https://www.jetbrains.com/datagrip/";
    documentation = "https://www.jetbrains.com/help/datagrip/settings-usage-statistics.html";
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
