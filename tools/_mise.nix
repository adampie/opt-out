{
  # mise does not collect telemetry or analytics data of its own.
  # The only telemetry-related setting (MISE_DOTNET_CLI_TELEMETRY_OPTOUT) controls
  # .NET SDK telemetry, not mise itself.
  name = "mise";
  meta = {
    description = "Polyglot runtime and tool version manager";
    homepage = "https://github.com/jdx/mise";
    documentation = "https://mise.jdx.dev/configuration.html";
    lastChecked = "2026-03-14";
    hasTelemetry = false;
  };
  variables = { };
  commands = { };
}
