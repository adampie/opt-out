{
  name = "n8n";
  meta = {
    description = "n8n workflow automation platform";
    homepage = "https://github.com/n8n-io/n8n";
    documentation = "https://docs.n8n.io/deploy/host-n8n/configure-n8n/security/control-telemetry";
    lastChecked = "2026-08-01";
    hasTelemetry = true;
  };
  variables = {
    N8N_DIAGNOSTICS_ENABLED = "false";
  };
  commands = { };
  config = { };
}
