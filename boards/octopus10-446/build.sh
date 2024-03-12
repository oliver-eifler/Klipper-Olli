#!/bin/bash
#if [ "$EUID" -ne 0 ]
#  then echo "ERROR: Please run as root"
#  exit
#fi
cp -f /home/pi/printer_data/config/boards/octopus10-446/firmware.config /home/pi/klipper/.config
pushd /home/pi/klipper
make olddefconfig
make clean
make

if [ ! -d "/home/pi/printer_data/config/binaries" ]
then
    mkdir /home/pi/printer_data/config/binaries
    chown pi:pi /home/pi/printer_data/config/binaries
fi
cp -f /home/pi/klipper/out/klipper.bin /home/pi/printer_data/config/binaries/firmware-octopus10-446.bin
chown pi:pi /home/pi/printer_data/config/binaries/firmware-octopus10-446.bin
popd
