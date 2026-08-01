{
  name = "snyk";
  meta = {
    description = "Snyk security vulnerability scanner CLI";
    homepage = "https://github.com/snyk/cli";
    documentation = "https://docs.snyk.io/developer-tools/snyk-cli/snyk-cli/configure-the-snyk-cli";
    lastChecked = "2026-08-01";
    hasTelemetry = true;
  };
  variables = {
    SNYK_DISABLE_ANALYTICS = "1";
  };
  commands = { };
  config = { };
}
