#!/usr/bin/env bash

rm -f /home/factorio/factorioServer/saves/*.tmp.zip
/usr/bin/screen -dmS factorio /bin/bash -c "/home/factorio/factorioServer/bin/x64/factorio --start-server-load-latest"
/usr/bin/screen -rD factorio -X multiuser on
/usr/bin/screen -rD factorio -X acladd root

#