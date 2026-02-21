{
  name = "storybook";
  meta = {
    description = "Storybook UI component development tool";
    homepage = "https://github.com/storybookjs/storybook";
    documentation = "https://storybook.js.org/docs/configure/telemetry";
  };
  variables = {
    STORYBOOK_DISABLE_TELEMETRY = "true";
  };
}
