# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

`opt-out` is a Nix Flake that centralizes telemetry opt-out environment variables for development tools. It generates Home Manager, nix-darwin, and NixOS modules from a collection of simple tool definition files.

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
mise run readme-vars    # regenerates the environment variables section in README.md
mise run readme-no-env-opt-out # regenerates the tools-without-an-env-var section in README.md
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

1. Create `tools/<toolname>.nix` from the matching template in `tools/README.md`. It covers all four shapes: active (env var opt-out), CLI opt-out, config-file opt-out, and no telemetry. Every key is asserted by `flake.nix`, so `commands` and `config` must be present even when empty.

2. Run `git add tools/<toolname>.nix`. Nix flakes operate on git-tracked files, so untracked files are silently ignored by `nix eval` and `nix flake check`.

3. Run `mise run readme-vars` to update the environment variables section in README.md. For an excluded (`_`-prefixed) tool, run `mise run readme-no-env-opt-out` instead, which regenerates the section listing tools no environment variable can cover.

The `name` field becomes the attribute name in all module outputs. No changes to `flake.nix` are needed, as `import-tree` picks up new files automatically.

### Key files

- `flake.nix` — all logic for assembling tool definitions into flake outputs, plus the lint devShell
- `tools/*.nix` — one file per tool, each a plain Nix attrset (not a function)
- `tools/README.md` — the four tool templates, and the single source of truth for tool file shape
- `scripts/readme-vars.sh` — generates the `<!-- vars:start -->`/`<!-- vars:end -->` section in README.md
- `scripts/no-env-opt-out.sh` — generates the `<!-- no-env-opt-out:start -->`/`<!-- no-env-opt-out:end -->` section in README.md from the `noEnvOptOut` flake output
- `hk.pkl` — git hooks config (pre-commit linters with auto-fix, pre-push flake check, README section generation)
- `mise.toml` — task runner for formatting, linting, flake operations, and README generation
- `mise.lock` — pins the exact version, checksum and download URL of every mise tool per platform
- `.github/workflows/ci.yml` — runs `mise run lint-all` on push to main and on pull requests

### Tooling versions

Two mechanisms, split by what each ecosystem can pin:

- Tools with a mise backend (shellcheck, shfmt, taplo, markdownlint-cli2, pkl, hk, zizmor) are pinned to exact versions in `mise.toml` and locked in `mise.lock`.
- nixfmt, statix, deadnix and yamllint have no mise backend, so they live in the flake's `devShells.default` and are pinned by `flake.lock`. Tasks that need them wrap themselves in `nix develop -c`, so no task assumes an ambient nixpkgs channel.

Run `mise lock --platform linux-x64,macos-arm64` after changing a pinned version, so CI's platform stays locked alongside the local one.

### Excluded tools

Files prefixed with `_` (e.g., `tools/_flutter.nix`) represent investigated tools that lack environment variable opt-out. These have an empty `variables = {};` block and use `commands` for CLI-based opt-out or `config` for config-file-based opt-out. `import-tree` ignores paths containing `/_` by default, so these files are excluded from all flake outputs.

### Criteria for adding a tool

Only add a tool if it has an **environment variable** that disables **telemetry, analytics, or crash reporting**. The following do not qualify:

- Update check suppression (e.g., `DENO_NO_UPDATE_CHECK`, `PDM_CHECK_UPDATE`)
- CLI-command-based opt-out (e.g., `flutter --disable-analytics`)
- Settings-file-based opt-out

Always verify the variable name against the tool's official documentation before adding.
