{
  name = "tailscale";
  meta = {
    description = "Tailscale zero-config mesh VPN for connecting devices across networks";
    homepage = "https://github.com/tailscale/tailscale";
    documentation = "https://tailscale.com/docs/features/logging?tab=linux";
    lastChecked = "2026-06-05";
    hasTelemetry = true;
  };
  variables = {
    TS_NO_LOGS_NO_SUPPORT = "true";
  };
  commands = { };
  config = { };
}
