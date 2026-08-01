{
  name = "dotnet";
  meta = {
    description = ".NET SDK and CLI";
    homepage = "https://github.com/dotnet/sdk";
    documentation = "https://learn.microsoft.com/en-us/dotnet/core/tools/telemetry";
    lastChecked = "2026-08-01";
    hasTelemetry = true;
  };
  variables = {
    DOTNET_CLI_TELEMETRY_OPTOUT = "1";
  };
  commands = { };
  config = { };
}
