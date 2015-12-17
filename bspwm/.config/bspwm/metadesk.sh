#!/bin/bash

mdc root -a
mdc root -a
mdc root -a
mdc root -a

mdc root -c 0 -a
mdc root -c 1 -a
mdc root -c 2 -a
mdc root -c 3 -a

mdc root -c 0 -A name chat
mdc root -c 1 -A name misc
mdc root -c 2 -A name auv
mdc root -c 3 -A name chem

mdc root -c 1 -f

mdc root -S lemonbar | lemonbar -g 1000x30+32 -B '#2D2D2D' -F '#EDEDED' -f 'sans:size=10' |\
	while read line; do
		mdc root -c $line -f
	done

