{
  name = "github-cli";
  meta = {
    description = "GitHub's official command line tool";
    homepage = "https://github.com/cli/cli";
    documentation = "https://cli.github.com/telemetry";
    lastChecked = "2026-04-22";
    hasTelemetry = true;
  };
  variables = {
    GH_TELEMETRY = "false";
  };
  commands = {
    disable = "gh config set telemetry disabled";
  };
  config = { };
}
