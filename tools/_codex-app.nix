# Codex App has telemetry (analytics events and OpenTelemetry metrics) but
# opt-out is config-file-based only (analytics.enabled = false in config.toml).
# No environment variable opt-out exists.
{
  name = "codex-app";
  meta = {
    description = "AI coding agent that runs in the terminal";
    homepage = "https://github.com/openai/codex";
    documentation = "https://github.com/openai/codex/blob/main/codex-rs/core/src/analytics_client.rs";
    lastChecked = "2026-03-14";
    hasTelemetry = true;
  };
  variables = { };
  commands = { };
}
