{
  # tailscaled starts at boot with no login session, so it never sees a variable
  # set by the three module outputs, which all act on login sessions. Reaching
  # the daemon needs the unit environment or /etc/default/tailscaled.
  name = "tailscale";
  meta = {
    description = "Tailscale zero-config mesh VPN for connecting devices across networks";
    homepage = "https://github.com/tailscale/tailscale";
    documentation = "https://tailscale.com/docs/features/logging?tab=linux";
    lastChecked = "2026-08-01";
    hasTelemetry = true;
  };
  variables = {
    TS_NO_LOGS_NO_SUPPORT = "true";
  };
  commands = { };
  config = { };
}
