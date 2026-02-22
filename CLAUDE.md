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
mise run fmt            # formats all Nix files via nixfmt-rfc-style (ephemeral nix-shell)
mise run lint           # lints Nix files with statix and deadnix
mise run lint-md        # lints Markdown files
mise run lint-sh        # lints shell scripts with shellcheck and shfmt
mise run lint-toml      # lints TOML files with taplo
mise run lint-yaml      # lints YAML files with yamllint
mise run lint-pkl       # lints Pkl files
mise run lint-all       # runs all linters (including flake-check)
mise run flake-update   # updates all flake inputs
mise run readme-vars    # regenerates the environment variables section in README.md
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

1. Create `tools/<toolname>.nix` following this template:

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

1. Run `git add tools/<toolname>.nix` — Nix flakes operate on git-tracked files, so untracked files are silently ignored by `nix eval` and `nix flake check`.

2. Run `mise run readme-vars` to update the environment variables section in README.md.

The `name` field becomes the attribute name in all module outputs. No changes to `flake.nix` are needed — `import-tree` picks up new files automatically.

### Key files

- `flake.nix` — all logic for assembling tool definitions into flake outputs
- `tools/*.nix` — one file per tool, each a plain Nix attrset (not a function)
- `tools/README.md` — the tool template
- `scripts/readme-vars.sh` — generates the `<!-- vars:start -->`/`<!-- vars:end -->` section in README.md
- `hk.pkl` — git hooks config (pre-commit linters with auto-fix, pre-push flake check, readme-vars generation)
- `mise.toml` — task runner for formatting, linting, flake operations, and README generation
- `.github/workflows/flakehub-publish-rolling.yml` — publishes to FlakeHub on every push to `main`

### Excluded tools

Files prefixed with `_` (e.g., `tools/_flutter.nix`) represent investigated tools that lack environment variable opt-out. These have an empty `variables = {};` block and a comment explaining why (e.g., CLI-only opt-out). `import-tree` ignores paths containing `/_` by default, so these files are excluded from all flake outputs.

### Criteria for adding a tool

Only add a tool if it has an **environment variable** that disables **telemetry, analytics, or crash reporting**. The following do not qualify:

- Update check suppression (e.g., `DENO_NO_UPDATE_CHECK`, `PDM_CHECK_UPDATE`)
- CLI-command-based opt-out (e.g., `flutter --disable-analytics`)
- Settings-file-based opt-out

Always verify the variable name against the tool's official documentation before adding.
