{
  name = "claude-code";
  meta = {
    description = "Anthropic Claude Code CLI";
    homepage = "https://github.com/anthropics/claude-code";
    documentation = "https://code.claude.com/docs/en/data-usage#telemetry-services";
  };
  variables = {
    DISABLE_TELEMETRY = "1";
    DISABLE_ERROR_REPORTING = "1";
  };
}
