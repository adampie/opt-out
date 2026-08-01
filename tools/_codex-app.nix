{
  name = "codex-app";
  meta = {
    description = "AI coding agent that runs in the terminal";
    homepage = "https://github.com/openai/codex";
    documentation = "https://learn.chatgpt.com/docs/config-file/config-reference";
    lastChecked = "2026-08-01";
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
