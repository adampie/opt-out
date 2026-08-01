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

<!-- tools:start -->

## Environment Variables

Set these to opt out. This is what the Nix modules above do for you.

| Tool | Variable | Last checked |
|---|---|---|
| [algolia-cli](https://github.com/algolia/cli) | `ALGOLIA_CLI_TELEMETRY=0` | 2026-03-29 |
| [amplify-cli](https://github.com/aws-amplify/amplify-cli) | `AMPLIFY_DISABLE_TELEMETRY=1` | 2026-02-22 |
| [angular-cli](https://github.com/angular/angular-cli) | `NG_CLI_ANALYTICS=false` | 2026-02-22 |
| [apollo](https://github.com/apollographql/rover) | `APOLLO_TELEMETRY_DISABLED=true` | 2026-03-29 |
| [astro](https://github.com/withastro/astro) | `ASTRO_TELEMETRY_DISABLED=1` | 2026-02-22 |
| [avalonia](https://github.com/AvaloniaUI/Avalonia) | `AVALONIA_TELEMETRY_OPTOUT=1` | 2026-02-22 |
| [aws-cdk](https://github.com/aws/aws-cdk) | `CDK_DISABLE_CLI_TELEMETRY=true` | 2026-02-22 |
| [aws-cli](https://github.com/aws/aws-cli) | `AWS_CLI_SESSION_ID_DISABLED=true` | 2026-08-01 |
| [aws-sam-cli](https://github.com/aws/aws-sam-cli) | `SAM_CLI_TELEMETRY=0` | 2026-03-29 |
| [azure-cli](https://github.com/Azure/azure-cli) | `AZURE_CORE_COLLECT_TELEMETRY=0` | 2026-03-29 |
| [bun](https://github.com/oven-sh/bun) | `DO_NOT_TRACK=1` | 2026-02-22 |
| [cargo-binstall](https://github.com/cargo-bins/cargo-binstall) | `BINSTALL_DISABLE_TELEMETRY=true` | 2026-03-29 |
| [claude-code](https://github.com/anthropics/claude-code) | `CLAUDE_CODE_DISABLE_FEEDBACK_SURVEY=1` | 2026-03-29 |
| [claude-code](https://github.com/anthropics/claude-code) | `CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC=1` | 2026-03-29 |
| [claude-code](https://github.com/anthropics/claude-code) | `DISABLE_ERROR_REPORTING=1` | 2026-03-29 |
| [claude-code](https://github.com/anthropics/claude-code) | `DISABLE_FEEDBACK_COMMAND=1` | 2026-03-29 |
| [claude-code](https://github.com/anthropics/claude-code) | `DISABLE_TELEMETRY=1` | 2026-03-29 |
| [cocoapods](https://github.com/CocoaPods/CocoaPods) | `COCOAPODS_DISABLE_STATS=true` | 2026-03-29 |
| [coder](https://github.com/coder/coder) | `CODER_DISABLE_NETWORK_TELEMETRY=true` | 2026-02-22 |
| [coder](https://github.com/coder/coder) | `CODER_TELEMETRY_ENABLE=false` | 2026-02-22 |
| [devbox](https://github.com/jetify-com/devbox) | `DO_NOT_TRACK=1` | 2026-02-22 |
| [devpod](https://github.com/loft-sh/devpod) | `DEVPOD_DISABLE_TELEMETRY=true` | 2026-02-22 |
| [do-not-track](https://github.com/adampie/opt-out) | `DO_NOT_TRACK=1` | 2026-02-22 |
| [do-not-track](https://github.com/adampie/opt-out) | `NO_TELEMETRY=1` | 2026-02-22 |
| [dotnet](https://github.com/dotnet/sdk) | `DOTNET_CLI_TELEMETRY_OPTOUT=1` | 2026-02-22 |
| [dotnet-testing-platform](https://github.com/microsoft/testfx) | `TESTINGPLATFORM_TELEMETRY_OPTOUT=1` | 2026-03-29 |
| [dvc](https://github.com/iterative/dvc) | `DVC_NO_ANALYTICS=true` | 2026-02-22 |
| [expo](https://github.com/expo/expo) | `EXPO_NO_TELEMETRY=1` | 2026-02-22 |
| [fastlane](https://github.com/fastlane/fastlane) | `FASTLANE_OPT_OUT_USAGE=YES` | 2026-02-22 |
| [flox](https://github.com/flox/flox) | `FLOX_DISABLE_METRICS=true` | 2026-03-29 |
| [gatsby](https://github.com/gatsbyjs/gatsby) | `GATSBY_TELEMETRY_DISABLED=1` | 2026-02-22 |
| [gemini](https://github.com/google-gemini/gemini-cli) | `GEMINI_TELEMETRY_ENABLED=false` | 2026-03-29 |
| [github-cli](https://github.com/cli/cli) | `GH_TELEMETRY=false` | 2026-04-22 |
| [gitpod](https://github.com/gitpod-io/gitpod) | `DO_NOT_TRACK=1` | 2026-02-22 |
| [google-cloud-sdk](https://github.com/google-cloud-sdk-unofficial/google-cloud-sdk) | `CLOUDSDK_CORE_DISABLE_USAGE_REPORTING=true` | 2026-03-29 |
| [grafana](https://github.com/grafana/grafana) | `GF_ANALYTICS_CHECK_FOR_PLUGIN_UPDATES=false` | 2026-03-29 |
| [grafana](https://github.com/grafana/grafana) | `GF_ANALYTICS_CHECK_FOR_UPDATES=false` | 2026-03-29 |
| [grafana](https://github.com/grafana/grafana) | `GF_ANALYTICS_REPORTING_ENABLED=false` | 2026-03-29 |
| [hashicorp](https://github.com/hashicorp/go-checkpoint) | `CHECKPOINT_DISABLE=1` | 2026-02-22 |
| [hasura](https://github.com/hasura/graphql-engine) | `HASURA_GRAPHQL_ENABLE_TELEMETRY=false` | 2026-03-29 |
| [homebrew](https://github.com/Homebrew/brew) | `HOMEBREW_NO_ANALYTICS=1` | 2026-02-22 |
| [influxdb](https://github.com/influxdata/influxdb) | `INFLUXD_REPORTING_DISABLED=true` | 2026-03-29 |
| [localstack](https://github.com/localstack/localstack) | `DISABLE_EVENTS=1` | 2026-02-22 |
| [meilisearch](https://github.com/meilisearch/meilisearch) | `MEILI_NO_ANALYTICS=` | 2026-02-22 |
| [meteor](https://github.com/meteor/meteor) | `DO_NOT_TRACK=1` | 2026-02-22 |
| [microsoft-go](https://github.com/microsoft/go) | `MS_GOTOOLCHAIN_TELEMETRY_ENABLED=0` | 2026-02-22 |
| [mise](https://github.com/jdx/mise) | `MISE_USE_VERSIONS_HOST_TRACK=false` | 2026-07-31 |
| [n8n](https://github.com/n8n-io/n8n) | `N8N_DIAGNOSTICS_ENABLED=false` | 2026-02-22 |
| [nextjs](https://github.com/vercel/next.js) | `NEXT_TELEMETRY_DISABLED=1` | 2026-02-22 |
| [nuxtjs](https://github.com/nuxt/telemetry) | `NUXT_TELEMETRY_DISABLED=1` | 2026-02-22 |
| [pi-coding-agent](https://github.com/earendil-works/pi/tree/main/packages/coding-agent) | `PI_TELEMETRY=0` | 2026-07-31 |
| [platformio](https://github.com/platformio/platformio-core) | `PLATFORMIO_SETTING_ENABLE_TELEMETRY=false` | 2026-03-29 |
| [powershell](https://github.com/PowerShell/PowerShell) | `POWERSHELL_TELEMETRY_OPTOUT=1` | 2026-03-29 |
| [prisma](https://github.com/prisma/prisma) | `CHECKPOINT_DISABLE=1` | 2026-02-22 |
| [redwood](https://github.com/redwoodjs/redwood) | `REDWOOD_DISABLE_TELEMETRY=1` | 2026-02-22 |
| [serverless](https://github.com/serverless/serverless) | `SLS_TELEMETRY_DISABLED=1` | 2026-03-29 |
| [shopify-cli](https://github.com/Shopify/cli) | `SHOPIFY_CLI_NO_ANALYTICS=1` | 2026-03-29 |
| [snyk](https://github.com/snyk/cli) | `SNYK_DISABLE_ANALYTICS=1` | 2026-03-29 |
| [steampipe](https://github.com/turbot/steampipe) | `STEAMPIPE_TELEMETRY=none` | 2026-03-29 |
| [storybook](https://github.com/storybookjs/storybook) | `STORYBOOK_DISABLE_TELEMETRY=true` | 2026-02-22 |
| [stripe-cli](https://github.com/stripe/stripe-cli) | `STRIPE_CLI_TELEMETRY_OPTOUT=1` | 2026-03-29 |
| [tailscale](https://github.com/tailscale/tailscale) | `TS_NO_LOGS_NO_SUPPORT=true` | 2026-06-05 |
| [turbo](https://github.com/vercel/turbo) | `TURBO_TELEMETRY_DISABLED=1` | 2026-03-29 |
| [vercel](https://github.com/vercel/vercel) | `VERCEL_TELEMETRY_DISABLED=1` | 2026-02-22 |
| [wrangler](https://github.com/cloudflare/workers-sdk) | `WRANGLER_SEND_METRICS=false` | 2026-02-22 |
| [xmake](https://github.com/xmake-io/xmake) | `XMAKE_STATS=false` | 2026-02-22 |
| [yarn](https://github.com/yarnpkg/berry) | `YARN_ENABLE_TELEMETRY=0` | 2026-02-22 |

## Commands

Run the command once and the telemetry stays off. Some of these tools have an environment variable too.

| Tool | Command | Last checked |
|---|---|---|
| [angular-cli](https://github.com/angular/angular-cli) | `ng analytics disable` | 2026-02-22 |
| [aws-cdk](https://github.com/aws/aws-cdk) | `cdk cli-telemetry --disable` | 2026-02-22 |
| [dvc](https://github.com/iterative/dvc) | `dvc config core.analytics false` | 2026-02-22 |
| [flutter](https://github.com/flutter/flutter) | `flutter --disable-analytics` | 2026-02-22 |
| [gatsby](https://github.com/gatsbyjs/gatsby) | `gatsby telemetry --disable` | 2026-02-22 |
| [github-cli](https://github.com/cli/cli) | `gh config set telemetry disabled` | 2026-04-22 |
| [go](https://github.com/golang/go) | `go telemetry off` | 2026-02-22 |
| [govulncheck](https://github.com/golang/vuln) | `go telemetry off` | 2026-03-28 |
| [opa](https://github.com/open-policy-agent/opa) | `opa run --disable-telemetry` | 2026-03-14 |
| [react-native-windows](https://github.com/microsoft/react-native-windows) | `npx react-native run-windows --no-telemetry` | 2026-02-22 |
| [wizcli](https://www.wiz.io/) | `wizcli --no-telemetry` | 2026-08-01 |

## Config

Opt out by editing a config file, or by changing a setting where no file backs it.

| Tool | Config | Last checked |
|---|---|---|
| [1password](https://1password.com) | `Manage Account > Usage Data` → `Share information about your usage across the 1Password apps = off` | 2026-08-01 |
| [codex](https://github.com/openai/codex) | `~/.codex/config.toml` → `analytics.enabled = false` | 2026-03-14 |
| [codex-app](https://github.com/openai/codex) | `~/.codex/config.toml` → `analytics.enabled = false` | 2026-03-14 |
| [datagrip](https://www.jetbrains.com/datagrip/) | `Settings > Appearance & Behavior > System Settings > Data Sharing` → `Send anonymous usage statistics = off` | 2026-08-01 |
| [discord](https://discord.com) | `User Settings > Data & Privacy` → `Use Data to Improve Discord = off` | 2026-08-01 |
| [docker-desktop](https://www.docker.com/products/docker-desktop/) | `~/.docker/desktop/settings-store.json` → `analyticsEnabled = false` | 2026-08-01 |
| [docker-desktop](https://www.docker.com/products/docker-desktop/) | `~/Library/Group Containers/group.com.docker/settings-store.json` → `analyticsEnabled = false` | 2026-08-01 |
| [earthly](https://github.com/earthly/earthly) | `~/.earthly/config.yml` → `global.disable_analytics = true` | 2026-03-29 |
| [goland](https://www.jetbrains.com/go/) | `Settings > Appearance & Behavior > System Settings > Data Sharing` → `Send anonymous usage statistics = off` | 2026-08-01 |
| [intellij-idea](https://www.jetbrains.com/idea/) | `Settings > Appearance & Behavior > System Settings > Data Sharing` → `Send anonymous usage statistics = off` | 2026-08-01 |
| [proxyman](https://proxyman.com) | `App Settings > Privacy` → `Share analytics with Proxyman = off` | 2026-08-01 |
| [proxyman](https://proxyman.com) | `App Settings > Privacy` → `Share crashed reports with Proxyman = off` | 2026-08-01 |
| [pycharm](https://www.jetbrains.com/pycharm/) | `Settings > Appearance & Behavior > System Settings > Data Sharing` → `Send anonymous usage statistics = off` | 2026-08-01 |
| [rustrover](https://www.jetbrains.com/rust/) | `Settings > Appearance & Behavior > System Settings > Data Sharing` → `Send anonymous usage statistics = off` | 2026-08-01 |
| [signoz](https://github.com/SigNoz/signoz) | `statsreporter` → `enabled = false` | 2026-03-29 |
| [webstorm](https://www.jetbrains.com/webstorm/) | `Settings > Appearance & Behavior > System Settings > Data Sharing` → `Send anonymous usage statistics = off` | 2026-08-01 |
| [zed](https://github.com/zed-industries/zed) | `~/.config/zed/settings.json` → `telemetry.diagnostics = false` | 2026-03-14 |
| [zed](https://github.com/zed-industries/zed) | `~/.config/zed/settings.json` → `telemetry.metrics = false` | 2026-03-14 |
| [zen-browser](https://github.com/zen-browser/desktop) | `about:config` → `datareporting.healthreport.uploadEnabled = false` | 2026-08-01 |
| [zen-browser](https://github.com/zen-browser/desktop) | `about:config` → `datareporting.policy.dataSubmissionEnabled = false` | 2026-08-01 |
| [zen-browser](https://github.com/zen-browser/desktop) | `about:config` → `toolkit.telemetry.enabled = false` | 2026-08-01 |

## No Way to Opt Out

Telemetry with nothing published that turns it off.

| Tool | Last checked |
|---|---|
| [bruno](https://github.com/usebruno/bruno) | 2026-08-01 |
| [claude](https://claude.ai) | 2026-03-14 |
| [cleanshot](https://cleanshot.com) | 2026-03-14 |
| [elgato-control-center](https://www.elgato.com/us/en/s/downloads) | 2026-03-14 |
| [mullvad](https://github.com/mullvad/mullvadvpn-app) | 2026-03-14 |
| [opencode-desktop](https://github.com/anomalyco/opencode) | 2026-07-31 |
| [orbstack](https://orbstack.dev) | 2026-03-14 |
| [slack](https://slack.com) | 2026-03-14 |
| [spotify](https://www.spotify.com) | 2026-03-14 |
| [tower](https://www.git-tower.com) | 2026-03-14 |
| [uv](https://github.com/astral-sh/uv) | 2026-08-01 |

<!-- tools:end -->
