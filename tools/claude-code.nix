{
  name = "claude-code";
  meta = {
    description = "Anthropic Claude Code CLI";
    homepage = "https://github.com/anthropics/claude-code";
    documentation = "https://code.claude.com/docs/en/data-usage#telemetry-services";
    lastChecked = "2026-03-29";
    hasTelemetry = true;
  };
  variables = {
    DISABLE_TELEMETRY = "1";
    DISABLE_ERROR_REPORTING = "1";
    DISABLE_FEEDBACK_COMMAND = "1";
    CLAUDE_CODE_DISABLE_FEEDBACK_SURVEY = "1";
    CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC = "1";
  };
  commands = { };
  config = { };
}
