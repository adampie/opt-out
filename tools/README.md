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
    hasTelemetry = true;
  };
  variables = {
    OPT_OUT_KEY = "OPT_OUT_VALUE";
  };
  commands = { };
  config = { };
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
    hasTelemetry = true;
  };
  variables = { };
  commands = {
    disable = "COMMAND_TO_DISABLE_TELEMETRY";
  };
  config = { };
}
```

## Excluded tool (config-file opt-out)

```nix
{
  name = "APP_OR_BINARY_NAME";
  meta = {
    description = "DESCRIPTION_FROM_REPOSITORY_OR_DOCUMENTATION";
    homepage = "LINK_TO_GIT_REPOSITORY";
    documentation = "LINK_TO_DOCUMENTATION_WITH_OPT_OUT_PROOF";
    lastChecked = "YYYY-MM-DD";
    hasTelemetry = true;
  };
  variables = { };
  commands = { };
  config = {
    "~/.toolname/config.toml" = {
      "telemetry.enabled" = "false";
    };
  };
}
```

## Excluded tool (settings-toggle opt-out)

For a GUI or account setting with no file behind it, put the menu path where the file
path would go and the control's own label in the inner attrset. The README generator
reads `config` to decide whether a tool has any opt-out at all, so leaving this empty
would list the tool as having none.

```nix
{
  name = "APP_OR_BINARY_NAME";
  meta = {
    description = "DESCRIPTION_FROM_REPOSITORY_OR_DOCUMENTATION";
    homepage = "LINK_TO_GIT_REPOSITORY";
    documentation = "LINK_TO_DOCUMENTATION_WITH_OPT_OUT_PROOF";
    lastChecked = "YYYY-MM-DD";
    hasTelemetry = true;
  };
  variables = { };
  commands = { };
  config = {
    "Settings > Privacy" = {
      "Send anonymous usage statistics" = "off";
    };
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
  config = { };
}
```
