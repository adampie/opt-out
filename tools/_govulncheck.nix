{
  name = "govulncheck";
  meta = {
    description = "Go vulnerability scanner for finding known vulnerabilities in dependencies";
    homepage = "https://github.com/golang/vuln";
    documentation = "https://go.dev/doc/telemetry";
    lastChecked = "2026-08-01";
    hasTelemetry = true;
  };
  variables = { };
  commands = {
    disable = "go telemetry off";
    status = "go telemetry";
  };
  config = { };
}
