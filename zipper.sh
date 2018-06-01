#!/bin/bash
torrentid=$1
torrentname=$2
torrentpath=$3

sleep [([(RANDOM % 10 )  + 1 ]s
if grep -q $torrentid /media/sdx1/cpiscos/private/deluge/ids
then
	exit
else
	echo $torrentid >> /media/sdx1/cpiscos/private/deluge/ids
fi

cd "${torrentpath}"

if [ -d "${torrentname}" ]; then
	zip -r "${torrentname}".zip "${torrentname}"
	rm -rf "${torrentname}"
	mv "${torrentname}".zip ./complete
fi

if [ -f "${torrentname}" ]; then
	mv "${torrentname}" ./complete
fi

if ! screen -list | grep -q "dmove"; then
	screen -dmS dmove rclone -v move /media/sdx1/cpiscos/private/deluge/data/complete gsuites:Downloads/deluge
fi

#echo "Torrent Details: " $torrentname $torrentpath $torrentid  >> /media/sdx1/cpiscos/execute_script.log
