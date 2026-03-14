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
  config = { };
}
