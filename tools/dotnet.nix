{
  name = "dotnet";
  meta = {
    description = ".NET SDK and CLI";
    homepage = "https://github.com/dotnet/sdk";
    documentation = "https://learn.microsoft.com/en-us/dotnet/core/tools/telemetry";
  };
  variables = {
    DOTNET_CLI_TELEMETRY_OPTOUT = "1";
  };
}
