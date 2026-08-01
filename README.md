# opt-out

A Nix flake that opts you out of telemetry for common tools by setting the appropriate environment variables.

## Nix

Add the flake as an input:

```nix
opt-out.url = "github:adampie/opt-out";
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
CODER_DISABLE_NETWORK_TELEMETRY=true # coder
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
GH_TELEMETRY=false # github-cli
HASURA_GRAPHQL_ENABLE_TELEMETRY=false # hasura
HOMEBREW_NO_ANALYTICS=1 # homebrew
INFLUXD_REPORTING_DISABLED=true # influxdb
MISE_USE_VERSIONS_HOST_TRACK=false # mise
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
SHOPIFY_CLI_NO_ANALYTICS=1 # shopify-cli
SLS_TELEMETRY_DISABLED=1 # serverless
SNYK_DISABLE_ANALYTICS=1 # snyk
STEAMPIPE_TELEMETRY=none # steampipe
STORYBOOK_DISABLE_TELEMETRY=true # storybook
STRIPE_CLI_TELEMETRY_OPTOUT=1 # stripe-cli
TESTINGPLATFORM_TELEMETRY_OPTOUT=1 # dotnet-testing-platform
TS_NO_LOGS_NO_SUPPORT=true # tailscale
TURBO_TELEMETRY_DISABLED=1 # turbo
VERCEL_TELEMETRY_DISABLED=1 # vercel
WRANGLER_SEND_METRICS=false # wrangler
XMAKE_STATS=false # xmake
YARN_ENABLE_TELEMETRY=0 # yarn
```
<!-- vars:end -->

## Tools Without an Environment Variable Opt-Out

These tools collect telemetry but expose no environment variable to disable it, so this flake cannot cover them. They are tracked here so the gap is visible rather than silently missing, and so a tool can be promoted the moment it ships a variable.

<!-- no-env-opt-out:start -->

### Opt-out available, but not through the environment

A documented opt-out exists, so these can be turned off; it just cannot be declared once and applied everywhere.

| Tool | What it is | How to opt out | Source | Last checked |
|---|---|---|---|---|
| [1password](https://1password.com) | Password manager desktop application | `Manage Account > Usage Data` → `Share information about your usage across the 1Password apps = off` | [Docs](https://support.1password.com/telemetry/) | 2026-08-01 |
| [codex](https://github.com/openai/codex) | Lightweight coding agent that runs in the terminal | `~/.codex/config.toml` → `analytics.enabled = false` | [Docs](https://developers.openai.com/codex/config-reference) | 2026-03-14 |
| [codex-app](https://github.com/openai/codex) | AI coding agent that runs in the terminal | `~/.codex/config.toml` → `analytics.enabled = false` | [Docs](https://developers.openai.com/codex/config-reference) | 2026-03-14 |
| [datagrip](https://www.jetbrains.com/datagrip/) | JetBrains DataGrip database IDE | `Settings > Appearance & Behavior > System Settings > Data Sharing` → `Send anonymous usage statistics = off` | [Docs](https://www.jetbrains.com/help/datagrip/settings-usage-statistics.html) | 2026-08-01 |
| [discord](https://discord.com) | A proprietary voice, video, and text communication platform | `User Settings > Privacy & Safety` → `Limit our ability to use your data to improve our services = on` | [Docs](https://discord.com/privacy) | 2026-08-01 |
| [earthly](https://github.com/earthly/earthly) | Earthly repeatable CI builds | `~/.earthly/config.yml` → `global.disable_analytics = true` | [Docs](https://docs.earthly.dev/docs/misc/data-collection) | 2026-03-29 |
| [flutter](https://github.com/flutter/flutter) | Flutter cross-platform UI SDK | `flutter --disable-analytics` | [Docs](https://docs.flutter.dev/reference/crash-reporting) | 2026-02-22 |
| [go](https://github.com/golang/go) | Go toolchain | `go telemetry off` | [Docs](https://go.dev/doc/telemetry) | 2026-02-22 |
| [goland](https://www.jetbrains.com/go/) | JetBrains GoLand Go IDE | `Settings > Appearance & Behavior > System Settings > Data Sharing` → `Send anonymous usage statistics = off` | [Docs](https://www.jetbrains.com/help/go/settings-usage-statistics.html) | 2026-08-01 |
| [govulncheck](https://github.com/golang/vuln) | Go vulnerability scanner for finding known vulnerabilities in dependencies | `go telemetry off` | [Docs](https://go.dev/doc/telemetry) | 2026-03-28 |
| [intellij-idea](https://www.jetbrains.com/idea/) | JetBrains IntelliJ IDEA Java and Kotlin IDE | `Settings > Appearance & Behavior > System Settings > Data Sharing` → `Send anonymous usage statistics = off` | [Docs](https://www.jetbrains.com/help/idea/settings-usage-statistics.html) | 2026-08-01 |
| [opa](https://github.com/open-policy-agent/opa) | General-purpose policy engine for cloud-native environments | `opa run --disable-telemetry` | [Docs](https://www.openpolicyagent.org/docs/latest/privacy/) | 2026-03-14 |
| [proxyman](https://proxyman.com) | A macOS, Windows, and Linux HTTP debugging proxy for developers | `App Settings > Privacy` → `Share analytics with Proxyman = off`, `Share crashed reports with Proxyman = off` | [Docs](https://proxyman.com/privacy) | 2026-08-01 |
| [pycharm](https://www.jetbrains.com/pycharm/) | Python IDE by JetBrains with intelligent code assistance and developer tools | `Settings > Appearance & Behavior > System Settings > Data Sharing` → `Send anonymous usage statistics = off` | [Docs](https://www.jetbrains.com/help/pycharm/settings-usage-statistics.html) | 2026-08-01 |
| [react-native-windows](https://github.com/microsoft/react-native-windows) | React Native for Windows | `npx react-native run-windows --no-telemetry` | [Docs](https://microsoft.github.io/react-native-windows/docs/run-windows-cli) | 2026-02-22 |
| [signoz](https://github.com/SigNoz/signoz) | SigNoz open-source observability platform | `statsreporter` → `enabled = false` | [Docs](https://signoz.io/docs/telemetry/) | 2026-03-29 |
| [webstorm](https://www.jetbrains.com/webstorm/) | JetBrains WebStorm JavaScript and TypeScript IDE | `Settings > Appearance & Behavior > System Settings > Data Sharing` → `Send anonymous usage statistics = off` | [Docs](https://www.jetbrains.com/help/webstorm/settings-usage-statistics.html) | 2026-08-01 |
| [zed](https://github.com/zed-industries/zed) | High-performance, multiplayer code editor | `~/.config/zed/settings.json` → `telemetry.diagnostics = false`, `telemetry.metrics = false` | [Docs](https://zed.dev/docs/telemetry) | 2026-03-14 |

### No documented opt-out

Telemetry with nothing published that turns it off.

| Tool | What it is | Source | Last checked |
|---|---|---|---|
| [claude](https://claude.ai) | Anthropic Claude desktop application | [Docs](https://support.claude.com/en/collections/16163169-claude-desktop) | 2026-03-14 |
| [cleanshot](https://cleanshot.com) | A macOS screenshot and screen recording tool | [Docs](https://cleanshot.com/legal/cloud/privacy) | 2026-03-14 |
| [elgato-control-center](https://www.elgato.com/us/en/s/downloads) | Elgato Control Center app for managing Elgato devices on macOS | [Docs](https://www.elgato.com/us/en/s/downloads) | 2026-03-14 |
| [mullvad](https://github.com/mullvad/mullvadvpn-app) | Mullvad VPN client application | [Docs](https://github.com/mullvad/mullvadvpn-app/blob/main/docs/logging-and-telemetry.md) | 2026-03-14 |
| [orbstack](https://orbstack.dev) | Docker and Linux VM manager for macOS | [Docs](https://docs.orbstack.dev/legal/privacy) | 2026-03-14 |
| [slack](https://slack.com) | A proprietary business communication platform developed by Salesforce | [Docs](https://slack.com/help) | 2026-03-14 |
| [spotify](https://www.spotify.com) | Music streaming service with desktop, mobile, and web clients | [Docs](https://www.spotify.com/us/safetyandprivacy/personal-data-collected) | 2026-03-14 |
| [tower](https://www.git-tower.com) | Git client for Mac and Windows | [Docs](https://www.git-tower.com/legal/privacy-policy) | 2026-03-14 |

<!-- no-env-opt-out:end -->
