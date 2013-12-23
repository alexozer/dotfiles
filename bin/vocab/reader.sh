#! /bin/sh
curl https://www.vocabulary.com/lists/148703#view=notes | grep '<a class="word"' | cut -d\> -f2 | cut -d\< -f1 > words & 
while read line; do
	echo Word is $line
done < words

