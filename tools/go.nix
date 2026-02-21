{
  name = "go";
  meta = {
    description = "Go toolchain";
    homepage = "https://github.com/golang/go";
    documentation = "https://go.dev/doc/telemetry";
  };
  variables = {
    GOTELEMETRY = "off";
  };
}
