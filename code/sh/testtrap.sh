#! /bin/bash

#outfile=/home/alex/fartfile
nothing.sh &

function cleanup() {
	for proc in $(jobs -p); do
		kill $proc
	done
}

#function trap_sigint() {
#	echo "sigint trapped" | tee $outfile
#	cleanup
#}

#function trap_sigterm() {
#	echo "sigterm trapped" | tee $outfile
#	cleanup
#}

#function trap_sighup() {
#	echo "sigterm trapped" | tee $outfile
#	cleanup
#}


#trap trap_sigint SIGINT
#trap trap_sigterm SIGTERM
#trap trap_sighup SIGHUP

trap cleanup EXIT
wait
