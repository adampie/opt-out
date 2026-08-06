{
  name = "launchbar";
  meta = {
    description = "Keyboard-driven application launcher and productivity utility for macOS";
    homepage = "https://www.obdev.at/products/launchbar/";
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
