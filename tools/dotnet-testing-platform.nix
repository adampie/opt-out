{
  name = "dotnet-testing-platform";
  meta = {
    description = "Microsoft Testing Platform for .NET";
    homepage = "https://github.com/microsoft/testfx";
    documentation = "https://learn.microsoft.com/en-us/dotnet/core/testing/microsoft-testing-platform-telemetry";
    lastChecked = "2026-03-29";
    hasTelemetry = true;
  };
  variables = {
    TESTINGPLATFORM_TELEMETRY_OPTOUT = "1";
  };
  commands = { };
  config = { };
}
