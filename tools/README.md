# Template

## Active tool (environment variable opt-out)

```nix
{
  name = "APP_OR_BINARY_NAME";
  meta = {
    description = "DESCRIPTION_FROM_REPOSITORY_OR_DOCUMENTATION";
    homepage = "LINK_TO_GIT_REPOSITORY";
    documentation = "LINK_TO_DOCUMENTATION_WITH_OPT_OUT_PROOF";
    lastChecked = "YYYY-MM-DD";
  };
  variables = {
    OPT_OUT_KEY = "OPT_OUT_VALUE";
  };
  commands = { };
}
```

## Excluded tool (CLI opt-out)

```nix
{
  name = "APP_OR_BINARY_NAME";
  meta = {
    description = "DESCRIPTION_FROM_REPOSITORY_OR_DOCUMENTATION";
    homepage = "LINK_TO_GIT_REPOSITORY";
    documentation = "LINK_TO_DOCUMENTATION_WITH_OPT_OUT_PROOF";
    lastChecked = "YYYY-MM-DD";
  };
  variables = { };
  commands = {
    disable = "COMMAND_TO_DISABLE_TELEMETRY";
  };
}
```

## Excluded tool (no telemetry)

```nix
{
  name = "APP_OR_BINARY_NAME";
  meta = {
    description = "DESCRIPTION_FROM_REPOSITORY_OR_DOCUMENTATION";
    homepage = "LINK_TO_GIT_REPOSITORY";
    documentation = "LINK_TO_DOCUMENTATION_WITH_OPT_OUT_PROOF";
    lastChecked = "YYYY-MM-DD";
    hasTelemetry = false;
  };
  variables = { };
  commands = { };
}
```
