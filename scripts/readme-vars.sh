#!/usr/bin/env bash
set -euo pipefail

readme="README.md"
marker_start="<!-- vars:start -->"
marker_end="<!-- vars:end -->"

lines=()

for f in tools/[!_]*.nix; do
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

# Counted as whole lines because the awk below matches them that way. A substring
# test would disagree with awk, take the replace branch on a near-miss, and write
# the README back with nothing substituted.
start_count=$(grep -c -Fx "$marker_start" "$readme" || true)
end_count=$(grep -c -Fx "$marker_end" "$readme" || true)

if ((start_count == 0 && end_count == 0)); then
	{
		printf '\n%s\n' "$marker_start"
		cat /tmp/vars-section.md
		printf '%s\n' "$marker_end"
	} >>"$readme"
elif ((start_count == 1 && end_count == 1)); then
	start_line=$(grep -n -Fx "$marker_start" "$readme" | cut -d: -f1)
	end_line=$(grep -n -Fx "$marker_end" "$readme" | cut -d: -f1)

	# awk sets in_block on the start marker and only clears it on the end marker.
	# Reach the end marker first and in_block never clears, so every remaining line
	# is suppressed and the result is a README truncated at the block.
	if ((start_line >= end_line)); then
		echo "readme-vars: $marker_end (line $end_line) precedes $marker_start (line $start_line) in $readme" >&2
		exit 1
	fi

	awk -v start="$marker_start" -v end="$marker_end" '
    $0 == start { print; in_block=1; while ((getline line < "/tmp/vars-section.md") > 0) print line; next }
    $0 == end   { in_block=0 }
    !in_block   { print }
  ' "$readme" >README.tmp && mv README.tmp "$readme"
else
	echo "readme-vars: expected one $marker_start and one $marker_end in $readme, found $start_count and $end_count" >&2
	exit 1
fi

echo "$readme updated with ${#sorted[@]} variables."
