#!/usr/bin/env bash

#cron:
#0 6,18 * * * systemctl reload factorio

link=$(wget --quiet -F -O - https://factorio.com/download | lynx -dump -source -stdin | grep -E '/get-download/[0-9]\.[0-9]+\.[0-9]+/headless/linux64' | awk -F'"' '{print $2}')

if [ -z $link ]; then echo "link is unset"; else

/usr/bin/screen -Rd factorio -X stuff "/save \r"
/usr/bin/screen -Rd factorio -X stuff "/quit \r"

wget https://factorio.com$link -O /home/factorio/factorio_headless.tar.xz

tar -xf /home/factorio/factorio_headless.tar.xz --overwrite --strip-components=1 -C /home/factorio/factorioServer

rm -f /home/factorio/factorio_headless.tar.xz

rm -f /home/factorio/factorioServer/saves/*.tmp.zip
/usr/bin/screen -dmS factorio /bin/bash -c "/home/factorio/factorioServer/bin/x64/factorio --start-server-load-latest"
/usr/bin/screen -rD factorio -X multiuser on
/usr/bin/screen -rD factorio -X acladd root

fi

#