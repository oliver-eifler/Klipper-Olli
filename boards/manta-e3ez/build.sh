#!/bin/bash
#if [ "$EUID" -ne 0 ]
#  then echo "ERROR: Please run as root"
#  exit
#fi
cp -f ~/printer_data/config/olli/boards/manta-e3ez/firmware.config ~/klipper/.config
pushd ~/klipper
make olddefconfig
make clean
make

if [ ! -d ~/printer_data/config/binaries ]
then
    mkdir ~/printer_data/config/binaries
    #chown pi:pi /home/pi/printer_data/config/binaries
    chmod -v 755 ~/printer_data/config/binaries
fi
cp -f ~/klipper/out/klipper.bin ~/printer_data/config/binaries/firmware-manta-e3ez.bin
#chown pi:pi /home/pi/printer_data/config/binaries/firmware-manta-e3ez.bin
chmod -v 644 ~/printer_data/config/binaries/firmware-manta-e3ez.bin
popd
