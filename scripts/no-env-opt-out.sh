#!/usr/bin/env bash
set -euo pipefail

readme="README.md"
marker_start="<!-- no-env-opt-out:start -->"
marker_end="<!-- no-env-opt-out:end -->"

# The _-prefixed tool files are invisible to import-tree, so the flake exposes
# them through noEnvOptOut specifically for this script. Reading them here with
# grep instead would mean reimplementing enough Nix to parse a nested config
# attrset.
data=$(nix eval --json .#noEnvOptOut)

render_rows() {
	# want=true emits the entries with some documented opt-out, want=false the
	# entries with none at all.
	jq -r --argjson want "$1" '
    def esc: gsub("\\|"; "\\|");

    # "status" commands only report the current setting, so they are not a way
    # out and would pad the column with noise. Settings are grouped under their
    # file or menu path so a tool with two toggles in one place does not repeat
    # the path, and nothing here emits inline HTML, which markdownlint rejects.
    def howto:
      ( (.commands | to_entries
                   | map(select(.key != "status"))
                   | map("`" + .value + "`"))
      + (.config | to_entries
                 | map("`" + .key + "` → "
                       + (.value
                          | to_entries
                          | map("`" + .key + " = " + .value + "`")
                          | join(", "))))
      ) | join("; ");

    to_entries
    | map(. + {how: (.value | howto)})
    | map(select((.how != "") == $want))
    | .[]
    | "| [" + (.key | esc) + "](" + .value.homepage + ") | "
      + (.value.description | esc)
      + (if $want then " | " + .how else "" end)
      + " | [Docs](" + .value.documentation + ") | "
      + .value.lastChecked + " |"
  ' <<<"$data"
}

manual_rows=$(render_rows true)
none_rows=$(render_rows false)
manual_count=$(grep -c '^|' <<<"$manual_rows" || true)
none_count=$(grep -c '^|' <<<"$none_rows" || true)

# readme_new is created beside README.md rather than in TMPDIR so the closing mv
# is a rename within one filesystem. A rename is atomic, so a run interrupted at
# any point before it leaves the committed README untouched rather than half
# written. Both temporaries get unpredictable names so a local process cannot
# pre-create them as symlinks and redirect the writes.
section=$(mktemp)
readme_new=$(mktemp ./.README.XXXXXX)
trap 'rm -f "$section" "$readme_new"' EXIT

{
	echo
	echo "### Opt-out available, but not through the environment"
	echo
	echo "A documented opt-out exists, so these can be turned off; it just cannot be declared once and applied everywhere."
	echo
	echo "| Tool | What it is | How to opt out | Source | Last checked |"
	echo "|---|---|---|---|---|"
	echo "$manual_rows"
	echo
	echo "### No documented opt-out"
	echo
	echo "Telemetry with nothing published that turns it off."
	echo
	echo "| Tool | What it is | Source | Last checked |"
	echo "|---|---|---|---|"
	echo "$none_rows"
	echo
} >"$section"

# Counted as whole lines because the awk below matches them that way. A substring
# test would disagree with awk, take the replace branch on a near-miss, and write
# the README back with nothing substituted.
start_count=$(grep -c -Fx "$marker_start" "$readme" || true)
end_count=$(grep -c -Fx "$marker_end" "$readme" || true)

if ((start_count != 1 || end_count != 1)); then
	echo "no-env-opt-out: expected one $marker_start and one $marker_end in $readme, found $start_count and $end_count" >&2
	exit 1
fi

start_line=$(grep -n -Fx "$marker_start" "$readme" | cut -d: -f1)
end_line=$(grep -n -Fx "$marker_end" "$readme" | cut -d: -f1)

# awk sets in_block on the start marker and only clears it on the end marker.
# Reach the end marker first and in_block never clears, so every remaining line
# is suppressed and the result is a README truncated at the block.
if ((start_line >= end_line)); then
	echo "no-env-opt-out: $marker_end (line $end_line) precedes $marker_start (line $start_line) in $readme" >&2
	exit 1
fi

awk -v start="$marker_start" -v end="$marker_end" -v section="$section" '
  $0 == start { print; in_block=1; while ((getline line < section) > 0) print line; next }
  $0 == end   { in_block=0 }
  !in_block   { print }
' "$readme" >"$readme_new"

# mktemp creates 0600 and the rename would carry that onto README.md.
chmod 644 "$readme_new"
mv "$readme_new" "$readme"

echo "$readme updated: $manual_count with a manual opt-out, $none_count with none."
