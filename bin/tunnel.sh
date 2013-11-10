#! /bin/sh

function checkMirrorlist() {
	if [ -e mirrorlist.backup ]; then
		echo "Warning! Backup mirrorlist exists."
		exit
	fi
}

if [[ $UID -ne 0 ]]; then
	echo "You aren't root!"
	exit
fi
checkMirrorlist
lastd=`pwd`
cd /etc/pacman.d
mv mirrorlist mirrorlist.backup
echo 'Server http://localhost:1234/archlinux/$repo/os/x86_64' > mirrorlist
ssh -L 1234:mirror.us.leaseweb.net:80 guest@oroide.com -N
checkMirrorlist
rm mirrorlist
mv mirrorlist.backup mirrorlist
cd "$lastd"
exit
