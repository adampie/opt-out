{
  name = "microsoft-go";
  meta = {
    description = "Microsoft build of Go with FIPS 140 compliance support";
    homepage = "https://github.com/microsoft/go";
    documentation = "https://github.com/microsoft/go#data-collection";
    lastChecked = "2026-02-22";
    hasTelemetry = true;
  };
  variables = {
    MS_GOTOOLCHAIN_TELEMETRY_ENABLED = "0";
  };
  commands = { };
}
