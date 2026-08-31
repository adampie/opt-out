# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

`opt-out` is a Nix Flake that centralises telemetry opt-out environment variables for development tools. It generates Home Manager, nix-darwin, and NixOS modules from a collection of tool definition files.

## Commands

This is a pure Nix project with no build step. Common operations:

```bash
# Check the flake is valid
nix flake check

# Update flake inputs
nix flake update

# Inspect flake outputs (list all available modules, variables, etc.)
nix flake show

# Evaluate a specific output (e.g., view all collected variables)
nix eval .#variables
```

### mise tasks

```bash
mise run flake-check    # validates the flake and all tool definitions
mise run validate-tools # validates every tool definition, including _-prefixed exclusions
mise run fmt            # formats all Nix files
mise run fmt-check      # fails if any Nix file is unformatted
mise run lint           # lints Nix files with statix and deadnix
mise run lint-md        # lints Markdown files
mise run lint-sh        # lints shell scripts with shellcheck and shfmt
mise run lint-toml      # lints TOML files with taplo
mise run lint-yaml      # lints YAML files with yamllint
mise run lint-pkl       # lints Pkl files
mise run lint-zizmor    # audits GitHub Actions workflows with zizmor
mise run lint-all       # runs every check above; this is what CI runs
mise run flake-update   # updates all flake inputs
mise run readme-tables  # regenerates the opt-out tables in README.md
```

## Architecture

### How it works

`flake.nix` uses `import-tree` to dynamically discover all `.nix` files in `tools/`. Each file is imported, and `flake-parts` assembles the outputs.

The pipeline: `tools/*.nix` → `toolDefs` list → `tools` attrset + `variables` merged attrset → three module outputs.

Each of the three module outputs (`homeManagerModules`, `darwinModules`, `nixosModules`) contains:

- One named module per tool (e.g., `.hashicorp`, `.nextjs`)
- A `default` module combining all tools' variables

The platform-specific variable attribute differs by target:

- Home Manager: `home.sessionVariables`
- nix-darwin: `environment.variables`
- NixOS: `environment.sessionVariables`

### Adding a new tool

1. Create `tools/<toolname>.nix` from the matching template in `tools/README.md`. It covers all five shapes: active (env var opt-out), CLI opt-out, config-file opt-out, settings-toggle opt-out, and no telemetry. Every key is asserted by `flake.nix`, so `commands` and `config` must be present even when empty.

2. Run `git add tools/<toolname>.nix`. Nix flakes operate on git-tracked files, so untracked files are silently ignored by `nix eval` and `nix flake check`.

3. Run `mise run readme-tables` to update the README tables. This covers excluded (`_`-prefixed) tools too, so it is worth running whichever shape the tool turned out to be.

The `name` field becomes the attribute name in all module outputs. No changes to `flake.nix` are needed, as `import-tree` picks up new files automatically.

### Key files

- `flake.nix`: all logic for assembling tool definitions into flake outputs, plus the lint devShell
- `tools/*.nix`: one file per tool, each a plain Nix attrset (not a function)
- `tools/README.md`: the five tool templates, and the single source of truth for tool file shape
- `scripts/readme-tables.sh`: generates the `<!-- tools:start -->`/`<!-- tools:end -->` section in README.md from the `catalogue` flake output, one table each for environment variables, commands, config, and tools with no opt-out at all
- `hk.pkl`: git hooks config (pre-commit linters with auto-fix, pre-push flake check, README table generation)
- `mise.toml`: task runner for formatting, linting, flake operations, and README generation
- `mise.lock`: pins the exact version, checksum and download URL of every mise tool per platform
- `.github/workflows/ci.yml`: runs `mise run lint-all` on push to main and on pull requests

### Tooling versions

Two mechanisms, split by what each ecosystem can pin:

- Tools with a mise backend (shellcheck, shfmt, taplo, markdownlint-cli2, pkl, hk, zizmor) are pinned to exact versions in `mise.toml` and locked in `mise.lock`.
- nixfmt, statix, deadnix and yamllint have no mise backend, so they live in the flake's `devShells.default` and are pinned by `flake.lock`. Tasks that need them wrap themselves in `nix develop -c`, so no task assumes an ambient nixpkgs channel.

Run `mise lock --platform linux-x64,macos-arm64` after changing a pinned version, so CI's platform stays locked alongside the local one.

### Excluded tools

Files prefixed with `_` (e.g., `tools/_flutter.nix`) represent investigated tools that lack an environment variable opt-out. These have an empty `variables = {};` block and use `commands` for CLI-based opt-out, `config` for config-file or settings-toggle opt-out, or leave both empty when the tool publishes no opt-out at all. `import-tree` ignores paths containing `/_` by default, so these files never reach the generated modules. The `catalogue` output reads `tools/` directly and does include them, which is how they reach the README tables.

### Criteria for adding a tool

Every tool worth investigating gets a file. The prefix decides where it ends up, so answer this first: does the tool have an **environment variable** that disables **telemetry, analytics, or crash reporting**?

- **Yes**. Add it as `tools/<name>.nix`. Its variables are merged into the Home Manager, nix-darwin and NixOS modules, which is the only shape those modules can express.
- **No**. Add it as `tools/_<name>.nix`. There is nothing for a module to set, but the tool still belongs in the README tables so the opt-out, or the documented absence of one, is on record.

None of these count as an environment variable opt-out, so a tool whose only route out is one of them takes the `_` prefix:

- CLI-command-based opt-out (e.g., `flutter --disable-analytics`), recorded in `commands`
- Config-file or settings-toggle opt-out (e.g., a GUI privacy checkbox), recorded in `config`

Update check suppression (e.g., `DENO_NO_UPDATE_CHECK`, `PDM_CHECK_UPDATE`) is not a telemetry opt-out at all, so it does not qualify under either heading and should not be recorded as one.

This holds even when the update check itself carries data. Some vendors piggyback system attributes on it and describe the result as anonymous statistics (Objective Development's apps send macOS version, CPU architecture and language this way). The tool still counts as having no telemetry, because the only control is the update check. Record the behaviour in a comment above `hasTelemetry` so the next investigation does not reach a different conclusion.

Always verify the variable name against the tool's official documentation before adding.
