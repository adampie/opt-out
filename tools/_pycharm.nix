{
  name = "pycharm";
  meta = {
    description = "Python IDE by JetBrains with intelligent code assistance and developer tools";
    homepage = "https://www.jetbrains.com/pycharm/";
    documentation = "https://www.jetbrains.com/help/pycharm/settings-usage-statistics.html";
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
