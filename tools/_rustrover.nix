{
  name = "rustrover";
  meta = {
    description = "JetBrains RustRover Rust IDE";
    homepage = "https://www.jetbrains.com/rust/";
    documentation = "https://www.jetbrains.com/help/rust/settings-usage-statistics.html";
    lastChecked = "2026-07-31";
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
