{
  name = "platformio";
  meta = {
    description = "PlatformIO embedded systems development platform";
    homepage = "https://github.com/platformio/platformio-core";
    documentation = "https://docs.platformio.org/en/latest/envvars.html";
    lastChecked = "2026-02-22";
    hasTelemetry = true;
  };
  variables = {
    PLATFORMIO_SETTING_ENABLE_TELEMETRY = "No";
  };
  commands = {
    status = "pio settings get";
  };
}
