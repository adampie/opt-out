{
  name = "go";
  meta = {
    description = "Go toolchain";
    homepage = "https://github.com/golang/go";
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
