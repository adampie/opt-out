{
  name = "go";
  meta = {
    description = "Go toolchain";
    homepage = "https://github.com/golang/go";
    documentation = "https://go.dev/doc/telemetry";
    lastChecked = "2026-02-22";
  };
  # GOTELEMETRY is read-only; telemetry can only be disabled via `go telemetry off` CLI command
  variables = { };
  commands = { };
}
