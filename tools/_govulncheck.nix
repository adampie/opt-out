# Not supported via environment variable.
# Govulncheck uses the Go toolchain's shared telemetry system.
# Opt-out requires a CLI command: go telemetry off
# See tools/_go.nix for the Go toolchain entry.
{
  name = "govulncheck";
  meta = {
    description = "Vulnerability scanner for Go projects that reports known vulnerabilities in dependencies";
    homepage = "https://github.com/golang/vuln";
    documentation = "https://go.dev/doc/telemetry";
    lastChecked = "2026-03-14";
    hasTelemetry = true;
  };
  variables = { };
  commands = {
    disable = "go telemetry off";
  };
}
