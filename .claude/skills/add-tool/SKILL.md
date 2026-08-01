---
name: add-tool
description: Investigate a tool and add it to the opt-out flake. Accepts a GitHub issue number or a bare tool name.
---

# Add tool

Investigate the tool named in $ARGUMENTS and determine whether it qualifies for the opt-out flake.

1. **Identify the tool.** If $ARGUMENTS is an issue number, run `gh issue view <number>` for the tool name and any linked documentation. If it is a bare tool name, use it directly and skip the issue-linking in step 7.

2. **Research it** against its official documentation and source repository, looking for an environment variable that disables telemetry, analytics, or crash reporting. Eligibility rules are in `CLAUDE.md`; only an environment variable qualifies.

3. **Check for duplicates** in `tools/`, including `_`-prefixed files.

4. **Create the tool file** from the matching template in `tools/README.md`. Use `tools/<toolname>.nix` when a qualifying environment variable exists, `tools/_<toolname>.nix` when it does not. Every key in the template is asserted by `flake.nix`, so include `commands` and `config` even when empty.

   Do not add comments restating what the metadata already says. Do add a brief comment when a tool has a data flow that deliberately falls outside the criteria, such as an update check that carries system statistics, so the next person does not re-investigate it and reach a different conclusion.

   Filling in the metadata:
   - `description` covers only this tool. No other tools, frameworks, or ecosystems.
   - `homepage` points at the tool's own repository.
   - `documentation` points at the page proving the opt-out. Prefer official docs; link source only where no public documentation exists.
   - `lastChecked` is today, `YYYY-MM-DD`.
   - `hasTelemetry` stays `true` for anything with telemetry, including tools excluded for only having a CLI or config opt-out. Set `false` only after confirming there is none.

5. **Stage and validate.** Flakes ignore untracked files, so the `git add` has to come first or the checks will not see the new tool.

   ```bash
   git add tools/<filename>.nix
   mise run fmt
   mise run lint
   mise run flake-check
   ```

6. **Regenerate the README.** Run this whether the tool was added or excluded: the tables cover commands, config and tools with no opt-out at all, so an exclusion changes the README too.

   ```bash
   mise run readme-tables
   git add README.md
   ```

7. **Ship it.** Never commit to `main` directly; move the staged work onto its own branch first.

   ```bash
   git switch -c add-tool/<toolname>
   git commit -m "Add <toolname> telemetry opt-out"
   git push -u origin add-tool/<toolname>
   gh pr create --assignee adampie --title "..." --body "..."
   ```

   If the work came from an issue, close it from the PR body with `Closes #<number>`.
