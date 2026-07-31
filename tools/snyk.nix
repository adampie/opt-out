{
  name = "snyk";
  meta = {
    description = "Snyk security vulnerability scanner CLI";
    homepage = "https://github.com/snyk/cli";
    documentation = "https://docs.snyk.io/snyk-cli/configure-the-snyk-cli";
    lastChecked = "2026-03-29";
    hasTelemetry = true;
  };
  variables = {
    SNYK_DISABLE_ANALYTICS = "1";
  };
  commands = { };
  config = { };
}
