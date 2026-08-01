{
  # The logging this disables belongs to the tailscaled daemon, which none of
  # the three module outputs reach. NixOS sets environment.sessionVariables
  # through PAM at login, and tailscaled starts at boot with no login session,
  # so the daemon never sees this. Reaching it needs the variable in the unit
  # environment, or /etc/default/tailscaled, which is outside what a plain
  # variable map can express.
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
