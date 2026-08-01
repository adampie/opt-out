{
  name = "earthly";
  meta = {
    description = "Earthly repeatable CI builds";
    homepage = "https://github.com/earthly/earthly";
    documentation = "https://docs.earthly.dev/docs/misc/data-collection";
    lastChecked = "2026-08-01";
    hasTelemetry = true;
  };
  variables = { };
  commands = { };
  config = {
    "~/.earthly/config.yml" = {
      "global.disable_analytics" = "true";
    };
  };
}
