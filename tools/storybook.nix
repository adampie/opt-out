{
  name = "storybook";
  meta = {
    description = "Storybook UI component development tool";
    homepage = "https://github.com/storybookjs/storybook";
    documentation = "https://storybook.js.org/docs/configure/telemetry";
    lastChecked = "2026-02-22";
    hasTelemetry = true;
  };
  variables = {
    STORYBOOK_DISABLE_TELEMETRY = "true";
  };
  commands = { };
}
