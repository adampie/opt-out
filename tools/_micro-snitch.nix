{
  name = "micro-snitch";
  meta = {
    description = "macOS menu bar app that monitors microphone and camera usage";
    homepage = "https://www.obdev.at/products/microsnitch/index.html";
    documentation = "https://www.obdev.at/privacy";
    lastChecked = "2026-08-01";
    # The update check also transmits macOS version, CPU architecture and
    # language. Still false: update-check suppression is not a telemetry opt-out.
    hasTelemetry = false;
  };
  variables = { };
  commands = { };
  config = { };
}
