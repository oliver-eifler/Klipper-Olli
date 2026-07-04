#!/bin/bash
#if [ "$EUID" -ne 0 ]
#  then echo "ERROR: Please run as root"
#  exit
#fi
cp -f ~/printer_data/config/boards/nitehawk36/firmware.config ~/klipper/.config
pushd ~/klipper
make olddefconfig
make clean
sudo service klipper stop
make flash FLASH_DEVICE=/dev/serial/by-id/usb-Klipper_rp2040_3033393834053B32-if00
sudo service klipper start
popd
