{
  name = "zed";
  meta = {
    description = "High-performance, multiplayer code editor";
    homepage = "https://github.com/zed-industries/zed";
    documentation = "https://zed.dev/docs/telemetry";
    lastChecked = "2026-03-14";
    hasTelemetry = true;
  };
  variables = { };
  commands = { };
  config = {
    "~/.config/zed/settings.json" = {
      "telemetry.diagnostics" = "false";
      "telemetry.metrics" = "false";
    };
  };
}
