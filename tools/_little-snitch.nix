{
  name = "little-snitch";
  meta = {
    description = "Network monitor and application firewall for macOS";
    homepage = "https://www.obdev.at/products/littlesnitch/";
    documentation = "https://www.obdev.at/privacy";
    lastChecked = "2026-08-01";
    # The "Automatically check for updates" preference also transmits macOS
    # version, CPU architecture and language for anonymous statistical
    # analysis. Left as no telemetry because suppressing an update check does
    # not qualify under the criteria, not because nothing is transmitted.
    hasTelemetry = false;
  };
  variables = { };
  commands = { };
  config = { };
}
