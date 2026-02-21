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
AMPLIFY_DISABLE_TELEMETRY=1 # amplify-cli
ASTRO_TELEMETRY_DISABLED=1 # astro
AVALONIA_TELEMETRY_OPTOUT=1 # avalonia
CDK_DISABLE_CLI_TELEMETRY=true # aws-cdk
CHECKPOINT_DISABLE=1 # hashicorp
CHECKPOINT_DISABLE=1 # prisma
CODER_TELEMETRY_ENABLE=false # coder
DEVPOD_DISABLE_TELEMETRY=true # devpod
DISABLE_ERROR_REPORTING=1 # claude-code
DISABLE_EVENTS=1 # localstack
DISABLE_TELEMETRY=1 # claude-code
DOTNET_CLI_TELEMETRY_OPTOUT=1 # dotnet
DO_NOT_TRACK=1 # bun
DO_NOT_TRACK=1 # devbox
DO_NOT_TRACK=1 # do-not-track
DO_NOT_TRACK=1 # gitpod
DO_NOT_TRACK=1 # meteor
DVC_NO_ANALYTICS=true # dvc
EARTHLY_DISABLE_ANALYTICS=1 # earthly
EXPO_NO_TELEMETRY=1 # expo
FASTLANE_OPT_OUT_USAGE=YES # fastlane
GATSBY_TELEMETRY_DISABLED=1 # gatsby
GEMINI_TELEMETRY_ENABLED=false # gemini
GF_ANALYTICS_REPORTING_ENABLED=false # grafana
GOTELEMETRY=off # go
HOMEBREW_NO_ANALYTICS=1 # homebrew
MEILI_NO_ANALYTICS=true # meilisearch
N8N_DIAGNOSTICS_ENABLED=false # n8n
NEXT_TELEMETRY_DISABLED=1 # nextjs
NG_CLI_ANALYTICS=false # angular-cli
NO_TELEMETRY=1 # do-not-track
NUXT_TELEMETRY_DISABLED=1 # nuxtjs
PLATFORMIO_SETTING_ENABLE_TELEMETRY=No # platformio
REDWOOD_DISABLE_TELEMETRY=1 # redwood
STORYBOOK_DISABLE_TELEMETRY=true # storybook
TELEMETRY_ENABLED=false # signoz
TURBO_TELEMETRY_DISABLED=1 # turbo
VERCEL_TELEMETRY_DISABLED=1 # vercel
WRANGLER_SEND_METRICS=false # wrangler
XMAKE_STATS=false # xmake
YARN_ENABLE_TELEMETRY=0 # yarn
```
<!-- vars:end -->
