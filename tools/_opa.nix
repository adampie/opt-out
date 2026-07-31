{
  name = "opa";
  meta = {
    description = "General-purpose policy engine for cloud-native environments";
    homepage = "https://github.com/open-policy-agent/opa";
    documentation = "https://www.openpolicyagent.org/docs/latest/privacy/";
    lastChecked = "2026-03-14";
    hasTelemetry = true;
  };
  variables = { };
  commands = {
    disable = "opa run --disable-telemetry";
  };
  config = { };
}
