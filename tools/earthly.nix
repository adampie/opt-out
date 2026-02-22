{
  name = "earthly";
  meta = {
    description = "Earthly repeatable CI builds";
    homepage = "https://github.com/earthly/earthly";
    documentation = "https://docs.earthly.dev/docs/misc/data-collection";
    lastChecked = "2026-02-22";
    hasTelemetry = true;
  };
  variables = {
    EARTHLY_DISABLE_ANALYTICS = "1";
  };
  commands = { };
}
