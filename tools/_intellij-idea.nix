{
  name = "intellij-idea";
  meta = {
    description = "JetBrains IntelliJ IDEA Java and Kotlin IDE";
    homepage = "https://www.jetbrains.com/idea/";
    documentation = "https://www.jetbrains.com/help/idea/settings-usage-statistics.html";
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
