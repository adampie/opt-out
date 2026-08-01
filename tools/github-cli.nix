{
  name = "github-cli";
  meta = {
    description = "GitHub's official command line tool";
    homepage = "https://github.com/cli/cli";
    documentation = "https://cli.github.com/telemetry";
    lastChecked = "2026-08-01";
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
