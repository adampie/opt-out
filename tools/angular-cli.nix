{
  name = "angular-cli";
  meta = {
    description = "Angular CLI";
    homepage = "https://github.com/angular/angular-cli";
    documentation = "https://github.com/angular/angular-cli/blob/main/docs/design/analytics.md";
    lastChecked = "2026-02-22";
    hasTelemetry = true;
  };
  variables = {
    NG_CLI_ANALYTICS = "false";
  };
  commands = {
    disable = "ng analytics disable";
    status = "ng analytics info";
  };
}
