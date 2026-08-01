#!/usr/bin/env bash
# The jq programs below are single-quoted deliberately: $name, $t and $where are
# jq variables and have to reach jq unexpanded, so the shell must not touch them.
# shellcheck disable=SC2016
set -euo pipefail

readme="README.md"
marker_start="<!-- tools:start -->"
marker_end="<!-- tools:end -->"

# One flake output feeds all four tables, so the sections cannot disagree about
# what a tool records. Reading tools/ with grep instead would mean
# reimplementing enough Nix to parse a nested config attrset.
data=$(nix eval --json .#catalogue)

# nix eval emits attribute names sorted, and jq's to_entries preserves that, so
# every table comes out ordered by tool without an explicit sort.
rows() {
	jq -r "$1" <<<"$data"
}

env_rows=$(rows '
  def esc: gsub("\\|"; "\\|");
  to_entries
  | map(select(.value.variables | length > 0))
  | map(.key as $name | .value as $t
        | $t.variables
        | to_entries
        | map("| [" + $name + "](" + $t.homepage + ") | `"
              + (.key | esc) + "=" + (.value | esc) + "` | "
              + $t.lastChecked + " |"))
  | flatten
  | .[]
')

# "status" commands only report the current setting, so they are not a way out
# and a tool with nothing but one is not really command-opt-outtable.
command_rows=$(rows '
  def esc: gsub("\\|"; "\\|");
  def optouts: .commands | to_entries | map(select(.key != "status"));
  to_entries
  | map(select(.value | optouts | length > 0))
  | map(.key as $name | .value as $t
        | $t | optouts
        | map("| [" + $name + "](" + $t.homepage + ") | `"
              + (.value | esc) + "` | " + $t.lastChecked + " |"))
  | flatten
  | .[]
')

config_rows=$(rows '
  def esc: gsub("\\|"; "\\|");
  to_entries
  | map(select(.value.config | length > 0))
  | map(.key as $name | .value as $t
        | $t.config
        | to_entries
        | map(.key as $where
              | .value
              | to_entries
              | map("| [" + $name + "](" + $t.homepage + ") | `"
                    + ($where | esc) + "` → `"
                    + (.key | esc) + " = " + (.value | esc) + "` | "
                    + $t.lastChecked + " |"))
        | flatten)
  | flatten
  | .[]
')

# Same "status is not a way out" rule the Commands table applies. Counting a
# status command as an opt-out here would drop a tool that has nothing but one
# from this table as well as that one, leaving it in no table at all.
none_rows=$(rows '
  def optouts: .commands | to_entries | map(select(.key != "status"));
  to_entries
  | map(select(.value.hasTelemetry
               and (.value.variables | length) == 0
               and (.value | optouts | length) == 0
               and (.value.config | length) == 0))
  | .[]
  | "| [" + .key + "](" + .value.homepage + ") | " + .value.lastChecked + " |"
')

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
	echo "## Environment Variables"
	echo
	echo "Set these to opt out. This is what the Nix modules above do for you."
	echo
	echo "| Tool | Variable | Last checked |"
	echo "|---|---|---|"
	echo "$env_rows"
	echo
	echo "## Commands"
	echo
	echo "No environment variable, but a command turns the telemetry off once."
	echo
	echo "| Tool | Command | Last checked |"
	echo "|---|---|---|"
	echo "$command_rows"
	echo
	echo "## Config"
	echo
	echo "Opt out by editing a config file, or by changing a setting where no file backs it."
	echo
	echo "| Tool | Config | Last checked |"
	echo "|---|---|---|"
	echo "$config_rows"
	echo
	echo "## No Way to Opt Out"
	echo
	echo "Telemetry with nothing published that turns it off."
	echo
	echo "| Tool | Last checked |"
	echo "|---|---|"
	echo "$none_rows"
	echo
} >"$section"

# Counted as whole lines because the awk below matches them that way. A substring
# test would disagree with awk, take the replace branch on a near-miss, and write
# the README back with nothing substituted.
start_count=$(grep -c -Fx "$marker_start" "$readme" || true)
end_count=$(grep -c -Fx "$marker_end" "$readme" || true)

if ((start_count != 1 || end_count != 1)); then
	echo "readme-tables: expected one $marker_start and one $marker_end in $readme, found $start_count and $end_count" >&2
	exit 1
fi

start_line=$(grep -n -Fx "$marker_start" "$readme" | cut -d: -f1)
end_line=$(grep -n -Fx "$marker_end" "$readme" | cut -d: -f1)

# awk sets in_block on the start marker and only clears it on the end marker.
# Reach the end marker first and in_block never clears, so every remaining line
# is suppressed and the result is a README truncated at the block.
if ((start_line >= end_line)); then
	echo "readme-tables: $marker_end (line $end_line) precedes $marker_start (line $start_line) in $readme" >&2
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

printf '%s updated: %d variables, %d commands, %d config settings, %d with no opt-out.\n' \
	"$readme" \
	"$(grep -c '^|' <<<"$env_rows" || true)" \
	"$(grep -c '^|' <<<"$command_rows" || true)" \
	"$(grep -c '^|' <<<"$config_rows" || true)" \
	"$(grep -c '^|' <<<"$none_rows" || true)"
