{
  name = "webstorm";
  meta = {
    description = "JetBrains WebStorm JavaScript and TypeScript IDE";
    homepage = "https://www.jetbrains.com/webstorm/";
    documentation = "https://www.jetbrains.com/help/webstorm/settings-usage-statistics.html";
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
