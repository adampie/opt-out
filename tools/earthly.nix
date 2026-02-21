{
  name = "earthly";
  meta = {
    description = "Earthly repeatable CI builds";
    homepage = "https://github.com/earthly/earthly";
    documentation = "https://docs.earthly.dev/docs/misc/data-collection";
  };
  variables = {
    EARTHLY_DISABLE_ANALYTICS = "1";
  };
}
