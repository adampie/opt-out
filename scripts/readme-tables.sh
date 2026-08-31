#!/usr/bin/env bash
# $name, $t and $where are jq variables, so the shell must not expand them.
# shellcheck disable=SC2016
set -euo pipefail

readme="README.md"
marker_start="<!-- tools:start -->"
marker_end="<!-- tools:end -->"

data=$(nix eval --json .#catalogue)

# nix eval sorts attribute names and to_entries preserves that, so no sort here.
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

# "status" commands only report the current setting, so they are not a way out.
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

# Counting a "status" command as an opt-out would leave a status-only tool in no
# table at all.
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

# readme_new sits beside README.md so the closing mv is an atomic same-filesystem
# rename.
# mktemp names both unpredictably, so no local process can pre-create symlinks.
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
	echo "Run the command once and the telemetry stays off. Some of these tools have an environment variable too."
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

# Whole-line matching, because the awk below matches that way.
start_count=$(grep -c -Fx "$marker_start" "$readme" || true)
end_count=$(grep -c -Fx "$marker_end" "$readme" || true)

if ((start_count != 1 || end_count != 1)); then
	echo "readme-tables: expected one $marker_start and one $marker_end in $readme, found $start_count and $end_count" >&2
	exit 1
fi

start_line=$(grep -n -Fx "$marker_start" "$readme" | cut -d: -f1)
end_line=$(grep -n -Fx "$marker_end" "$readme" | cut -d: -f1)

# awk clears in_block only on the end marker, so an end marker reached first
# would suppress every remaining line and truncate the README at the block.
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
