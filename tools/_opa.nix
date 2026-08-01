{
  name = "opa";
  meta = {
    description = "General-purpose policy engine for cloud-native environments";
    homepage = "https://github.com/open-policy-agent/opa";
    documentation = "https://www.openpolicyagent.org/docs/privacy";
    lastChecked = "2026-08-01";
    hasTelemetry = true;
  };
  variables = { };
  commands = {
    disable = "opa run --skip-version-check";
  };
  config = { };
}
