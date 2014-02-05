#!/bin/bash

dir=/tmp$(pwd)
mkdir -p $dir
for file in *.c; do
	cat $file | awk '/\/\// {print $0}; /\/\*/ {blk=1}; {if(blk) print $0}; /\*\// {blk=0}' | xargs -n1 | sort -u | xargs > $dir$file
echo -en "\033]0;Checking ${file}\a"
aspell -c $dir$file
done

