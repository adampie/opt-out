{
  name = "claude-code";
  meta = {
    description = "Anthropic Claude Code CLI";
    homepage = "https://github.com/anthropics/claude-code";
    documentation = "https://code.claude.com/docs/en/data-usage#telemetry-services";
  };
  variables = {
    CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC = "1"; # opt out of all
    DISABLE_TELEMETRY = "1"; # Statsig (Metrics)
    DISABLE_ERROR_REPORTING = "1"; # Sentry (Errors)
    DISABLE_BUG_COMMAND = "1"; # Claude API (/bug reports)
    CLAUDE_CODE_DISABLE_FEEDBACK_SURVEY = "1"; # Session quality surveys
  };
}
