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

# readme_new is created beside README.md rather than in TMPDIR so the closing mv
# is a rename within one filesystem. A rename is atomic, so a run interrupted at
# any point before it leaves the committed README untouched rather than half
# written. Both temporaries get unpredictable names so a local process cannot
# pre-create them as symlinks and redirect the writes.
vars_section=$(mktemp)
readme_new=$(mktemp ./.README.XXXXXX)
trap 'rm -f "$vars_section" "$readme_new"' EXIT

{
	echo '```sh'
	for line in "${sorted[@]}"; do
		echo "$line"
	done
	echo '```'
} >"$vars_section"

# Counted as whole lines because the awk below matches them that way. A substring
# test would disagree with awk, take the replace branch on a near-miss, and write
# the README back with nothing substituted.
start_count=$(grep -c -Fx "$marker_start" "$readme" || true)
end_count=$(grep -c -Fx "$marker_end" "$readme" || true)

if ((start_count == 0 && end_count == 0)); then
	cat "$readme" >"$readme_new"
	{
		printf '\n%s\n' "$marker_start"
		cat "$vars_section"
		printf '%s\n' "$marker_end"
	} >>"$readme_new"
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

	awk -v start="$marker_start" -v end="$marker_end" -v section="$vars_section" '
    $0 == start { print; in_block=1; while ((getline line < section) > 0) print line; next }
    $0 == end   { in_block=0 }
    !in_block   { print }
  ' "$readme" >"$readme_new"
else
	echo "readme-vars: expected one $marker_start and one $marker_end in $readme, found $start_count and $end_count" >&2
	exit 1
fi

# mktemp creates 0600 and the rename would carry that onto README.md.
chmod 644 "$readme_new"
mv "$readme_new" "$readme"

echo "$readme updated with ${#sorted[@]} variables."
