{
  name = "govulncheck";
  meta = {
    description = "Go vulnerability scanner for finding known vulnerabilities in dependencies";
    homepage = "https://github.com/golang/vuln";
    documentation = "https://go.dev/doc/telemetry";
    lastChecked = "2026-03-28";
    hasTelemetry = true;
  };
  variables = { };
  commands = {
    disable = "go telemetry off";
    status = "go telemetry";
  };
  config = { };
}
