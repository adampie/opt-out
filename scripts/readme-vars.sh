#!/usr/bin/env bash
set -euo pipefail

lines=()

for f in tools/*.nix; do
	name=$(grep -m1 'name = "' "$f" | sed 's/.*"\(.*\)".*/\1/' 2>/dev/null || true)
	[[ -z "$name" ]] && continue

	while IFS= read -r line; do
		if [[ "$line" =~ ^[[:space:]]+([A-Z_][A-Z0-9_]+)[[:space:]]*=[[:space:]]*\"(.+)\"[[:space:]]*\; ]]; then
			key="${BASH_REMATCH[1]}"
			val="${BASH_REMATCH[2]}"
			lines+=("$key=$val # $name")
		fi
	done <"$f"
done

mapfile -t sorted < <(printf '%s\n' "${lines[@]}" | sort)

{
	echo '```sh'
	for line in "${sorted[@]}"; do
		echo "$line"
	done
	echo '```'
} >/tmp/vars-section.md

marker_start="<!-- vars:start -->"
marker_end="<!-- vars:end -->"

if grep -q "$marker_start" README.md; then
	awk -v start="$marker_start" -v end="$marker_end" '
    $0 == start { print; in_block=1; while ((getline line < "/tmp/vars-section.md") > 0) print line; next }
    $0 == end   { in_block=0 }
    !in_block   { print }
  ' README.md >README.tmp && mv README.tmp README.md
else
	{
		printf "\n%s\n" "$marker_start"
		cat /tmp/vars-section.md
		printf "%s\n" "$marker_end"
	} >>README.md
fi

echo "README.md updated with ${#sorted[@]} variables."
