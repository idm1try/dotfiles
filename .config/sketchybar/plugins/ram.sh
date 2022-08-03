#!/bin/bash
ram_percentage_format="%3.1f%%"

stats="$(vm_stat)"

sum_macos_vm_stats() {
	grep -Eo '[0-9]+' |
		awk '{ a += $1 * 4096 } END { print a }'
}

used_and_cached=$(
	echo "$stats" |
		grep -E "(Pages active|Pages inactive|Pages speculative|Pages wired down|Pages occupied by compressor)" |
		sum_macos_vm_stats
)

cached=$(
	echo "$stats" |
		grep -E "(Pages purgeable|File-backed pages)" |
		sum_macos_vm_stats
)

free=$(
	echo "$stats" |
		grep -E "(Pages free)" |
		sum_macos_vm_stats
)

used=$((used_and_cached - cached))
total=$((used_and_cached + free))
sketchybar -m --set $NAME label=$(echo "$used $total" | awk -v format="$ram_percentage_format" '{printf(format, 100*$1/$2)}')
