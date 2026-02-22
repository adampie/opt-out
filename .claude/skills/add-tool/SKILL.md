---
name: add-tool
description: Investigate a tool from a GitHub issue and add it to the opt-out flake
---

# Add tool

Investigate the tool described in GitHub issue $ARGUMENTS and determine whether it qualifies for the opt-out flake.

1. **Read the GitHub issue** using `gh issue view` to get the tool name and any linked documentation.

2. **Research the tool** by visiting its official documentation and source repository. Look specifically for environment variables that disable telemetry, analytics, or crash reporting.

3. **Verify eligibility.** Only environment variable opt-outs qualify. The following do NOT qualify:
   - Update check suppression (e.g., `DENO_NO_UPDATE_CHECK`)
   - CLI-command-based opt-out (e.g., `flutter --disable-analytics`)
   - Settings-file-based opt-out

4. **Check for duplicates.** Verify the tool does not already exist in `tools/` (including `_`-prefixed excluded files).

5. **Create the tool file:**

   **If a valid env var opt-out exists**, create `tools/<toolname>.nix`:

   ```nix
   {
     name = "<toolname>";
     meta = {
       description = "<description of the tool itself — do not reference other tools>";
       homepage = "<link to the tool's git repository>";
       documentation = "<link to the specific documentation page proving the env var opt-out>";
     };
     variables = {
       ENV_VAR_NAME = "value";
     };
   }
   ```

   **If NO valid env var opt-out exists**, create `tools/_<toolname>.nix`:

   ```nix
   # Not supported via environment variable.
   # <Explain why: e.g., "Opt-out requires CLI: tool --disable-analytics">
   {
     name = "<toolname>";
     meta = {
       description = "<description of the tool itself — do not reference other tools>";
       homepage = "<link to the tool's git repository>";
       documentation = "<link to relevant documentation>";
     };
     variables = { };
   }
   ```

6. **Metadata rules:**
   - The `description` must describe only the tool being added. Do not mention other tools, frameworks, or ecosystems.
   - The `homepage` must link to the tool's own repository.
   - The `documentation` must link to the tool's own documentation page that covers telemetry/analytics opt-out.

7. **Stage, format, and validate:**

   ```bash
   git add tools/<filename>.nix
   mise run fmt
   mise run lint
   mise run flake-check
   ```

8. **Update README if the tool was added (not `_`-prefixed):**

   ```bash
   mise run readme-vars
   git add README.md
   ```

9. **Commit, push, and create a PR:**
   - Create a branch named `add-tool/<toolname>`
   - Commit with a clear message describing the addition
   - Push and create a PR using `gh pr create`
   - **Assign the PR to `@adampie`**
   - **Link to the GitHub issue in the PR body:**
     - Use `Closes #<number>` if the tool was added (valid env var opt-out found)
     - Use `Relates to #<number>` if the tool was excluded (`_`-prefixed), since the issue is not resolved
