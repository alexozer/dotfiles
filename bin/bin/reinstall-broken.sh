#!/bin/bash

pacman -Q --check 2>/dev/null |\
	while read line; do
		n=$(echo "$line" | grep -Eo '\w+ missing files$' | cut -d' ' -f1)
		[[ "$n" == "0" ]] && continue

		pkg=$(echo "$line" | cut -d: -f1)
		echo $pkg
	done |\
		sudo pacman -S -

