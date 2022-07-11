#!/bin/bash

echo -e "\nThis script runs MacOS Montery inside docker container.\n"
read -p "Press enter to continue..."

echo "\nStarting docker"
systemctl start docker || exit

echo "\nEnabling GTK access"
xhost +

echo "\nRunning montery image"
docker run -it \
  --name docker-osx \
  --device /dev/kvm \
  -p 50922:10022 \
  -e AUDIO_DRIVER=pa,server=unix:/tmp/pulseaudio.socket \
  -v "/run/user/$(id -u)/pulse/native:/tmp/pulseaudio.socket" \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -e "DISPLAY=${DISPLAY:-:0.0}" \
  -e RAM=12 \
  -e GENERATE_UNIQUE=true \
  -e MASTER_PLIST_URL='https://raw.githubusercontent.com/sickcodes/osx-serial-generator/master/config-custom.plist' \
  sickcodes/docker-osx:monterey
