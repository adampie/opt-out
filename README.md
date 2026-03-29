# opt-out

A Nix flake that opts you out of telemetry for common tools by setting the appropriate environment variables.

## Nix

Add the flake as an input:

```nix
inputs.opt-out.url = "https://flakehub.com/f/adampie/opt-out/0.1";
```

Then import the module for your platform. Use `default` to opt out of everything, or individual tool names to be selective.

| Platform | All tools | Individual tool |
|---|---|---|
| Home Manager | `inputs.opt-out.homeManagerModules.default` | `inputs.opt-out.homeManagerModules.hashicorp` |
| nix-darwin | `inputs.opt-out.darwinModules.default` | `inputs.opt-out.darwinModules.hashicorp` |
| NixOS | `inputs.opt-out.nixosModules.default` | `inputs.opt-out.nixosModules.hashicorp` |

## Environment Variables

For non-Nix environments, the opt-out variables are as follows:

<!-- vars:start -->
```sh
ALGOLIA_CLI_TELEMETRY=0 # algolia-cli
AMPLIFY_DISABLE_TELEMETRY=1 # amplify-cli
APOLLO_TELEMETRY_DISABLED=true # apollo
ASTRO_TELEMETRY_DISABLED=1 # astro
AVALONIA_TELEMETRY_OPTOUT=1 # avalonia
AZURE_CORE_COLLECT_TELEMETRY=0 # azure-cli
BINSTALL_DISABLE_TELEMETRY=true # cargo-binstall
CDK_DISABLE_CLI_TELEMETRY=true # aws-cdk
CHECKPOINT_DISABLE=1 # hashicorp
CHECKPOINT_DISABLE=1 # prisma
CLAUDE_CODE_DISABLE_FEEDBACK_SURVEY=1 # claude-code
CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC=1 # claude-code
CLOUDSDK_CORE_DISABLE_USAGE_REPORTING=true # google-cloud-sdk
COCOAPODS_DISABLE_STATS=true # cocoapods
CODER_TELEMETRY_ENABLE=false # coder
DEVPOD_DISABLE_TELEMETRY=true # devpod
DISABLE_ERROR_REPORTING=1 # claude-code
DISABLE_EVENTS=1 # localstack
DISABLE_FEEDBACK_COMMAND=1 # claude-code
DISABLE_TELEMETRY=1 # claude-code
DO_NOT_TRACK=1 # bun
DO_NOT_TRACK=1 # devbox
DO_NOT_TRACK=1 # do-not-track
DO_NOT_TRACK=1 # gitpod
DO_NOT_TRACK=1 # meteor
DOTNET_CLI_TELEMETRY_OPTOUT=1 # dotnet
DVC_NO_ANALYTICS=true # dvc
EXPO_NO_TELEMETRY=1 # expo
FASTLANE_OPT_OUT_USAGE=YES # fastlane
FLOX_DISABLE_METRICS=true # flox
GATSBY_TELEMETRY_DISABLED=1 # gatsby
GEMINI_TELEMETRY_ENABLED=false # gemini
GF_ANALYTICS_CHECK_FOR_PLUGIN_UPDATES=false # grafana
GF_ANALYTICS_CHECK_FOR_UPDATES=false # grafana
GF_ANALYTICS_REPORTING_ENABLED=false # grafana
HASURA_GRAPHQL_ENABLE_TELEMETRY=false # hasura
HOMEBREW_NO_ANALYTICS=1 # homebrew
INFLUXD_REPORTING_DISABLED=true # influxdb
MS_GOTOOLCHAIN_TELEMETRY_ENABLED=0 # microsoft-go
N8N_DIAGNOSTICS_ENABLED=false # n8n
NEXT_TELEMETRY_DISABLED=1 # nextjs
NG_CLI_ANALYTICS=false # angular-cli
NO_TELEMETRY=1 # do-not-track
NUXT_TELEMETRY_DISABLED=1 # nuxtjs
PLATFORMIO_SETTING_ENABLE_TELEMETRY=false # platformio
POWERSHELL_TELEMETRY_OPTOUT=1 # powershell
REDWOOD_DISABLE_TELEMETRY=1 # redwood
SAM_CLI_TELEMETRY=0 # aws-sam-cli
SNYK_DISABLE_ANALYTICS=1 # snyk
STEAMPIPE_TELEMETRY=none # steampipe
STORYBOOK_DISABLE_TELEMETRY=true # storybook
STRIPE_CLI_TELEMETRY_OPTOUT=1 # stripe-cli
TESTINGPLATFORM_TELEMETRY_OPTOUT=1 # dotnet-testing-platform
TURBO_TELEMETRY_DISABLED=1 # turbo
VERCEL_TELEMETRY_DISABLED=1 # vercel
WRANGLER_SEND_METRICS=false # wrangler
XMAKE_STATS=false # xmake
YARN_ENABLE_TELEMETRY=0 # yarn
```
<!-- vars:end -->
