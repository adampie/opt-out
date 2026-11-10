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

### devenv

Run these inside `devenv shell`:

```bash
devenv test        # flake check, validate-tools, then every git hook on every file; this is what CI runs
validate-tools     # validates every tool definition, including _-prefixed exclusions
readme-tables      # regenerates the opt-out tables in README.md
pre-commit run -a  # runs every git hook on every file, applying formatter fixes
devenv update      # updates devenv.lock
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

3. Run `readme-tables` to update the README tables. This covers excluded (`_`-prefixed) tools too, so it is worth running whichever shape the tool turned out to be.

The `name` field becomes the attribute name in all module outputs. No changes to `flake.nix` are needed, as `import-tree` picks up new files automatically.

### Key files

- `flake.nix`: all logic for assembling tool definitions into flake outputs
- `tools/*.nix`: one file per tool, each a plain Nix attrset (not a function)
- `tools/README.md`: the five tool templates, and the single source of truth for tool file shape
- `scripts/readme-tables.sh`: generates the `<!-- tools:start -->`/`<!-- tools:end -->` section in README.md from the `catalogue` flake output, one table each for environment variables, commands, config, and tools with no opt-out at all
- `devenv.nix`: dev packages, the `readme-tables` and `validate-tools` scripts, git hooks (pre-commit linters, pre-push flake check, README table generation) and the `devenv test` body
- `devenv.yaml` and `devenv.lock`: devenv inputs, kept apart from `flake.lock` so flake consumers never pull in lint tooling
- `.github/workflows/ci.yml`: runs `devenv test` on push to main and on pull requests

### Tooling versions

Every linter comes from the nixpkgs pinned in `devenv.lock`; `devenv update` moves them. CI installs a fixed devenv release in `.github/workflows/ci.yml`, so bump it alongside a local devenv upgrade.

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
