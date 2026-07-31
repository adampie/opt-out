{
  name = "codex-app";
  meta = {
    description = "AI coding agent that runs in the terminal";
    homepage = "https://github.com/openai/codex";
    documentation = "https://developers.openai.com/codex/config-reference";
    lastChecked = "2026-03-14";
    hasTelemetry = true;
  };
  variables = { };
  commands = { };
  config = {
    "~/.codex/config.toml" = {
      "analytics.enabled" = "false";
    };
  };
}
