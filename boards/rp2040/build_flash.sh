#!/bin/bash
#if [ "$EUID" -ne 0 ]
#  then echo "ERROR: Please run as root"
#  exit
#fi
cp -f ~/printer_data/config/olli/boards/rp2040/firmware.config ~/klipper/.config
pushd ~/klipper
make olddefconfig
make clean
sudo service klipper stop
make flash FLASH_DEVICE=/dev/serial/by-id/usb-Klipper_rp2040_E66034F71F629F36-if00
sudo service klipper start
popd
