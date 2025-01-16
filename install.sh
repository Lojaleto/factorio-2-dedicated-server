#!/usr/bin/env bash

#crontab -e
#0 6,18 * * * systemctl reload factorio

useradd factorio
mkdir -p /home/factorio/factorioServer/saves

link=$(wget --quiet -F -O - https://factorio.com/download | lynx -dump -source -stdin | grep -E '/get-download/[0-9]\.[0-9]+\.[0-9]+/headless/linux64' | awk -F'"' '{print $2}')
wget https://factorio.com$link -O /home/factorio/factorio_headless.tar.xz
tar -xf /home/factorio/factorio_headless.tar.xz --overwrite --strip-components=1 -C /home/factorio/factorioServer
rm -f /home/factorio/factorio_headless.tar.xz
fi

cp ./start.sh ./stop.sh ./upgrade.sh ./server-adminlist.json /home/factorio/factorioServer/
cp ./factorio.service /etc/systemd/system/factorio.service
systemctl daemon-reload
systemctl enable factorio

chown -R factorio:factorio /home/factorio
#
