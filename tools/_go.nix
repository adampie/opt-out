{
  name = "go";
  meta = {
    description = "Go toolchain";
    homepage = "https://github.com/golang/go";
    documentation = "https://go.dev/doc/telemetry";
    lastChecked = "2026-02-22";
    hasTelemetry = true;
  };
  variables = { };
  commands = {
    disable = "go telemetry off";
    status = "go telemetry";
  };
}
