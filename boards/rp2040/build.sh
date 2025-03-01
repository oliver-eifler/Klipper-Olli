#!/bin/bash
#if [ "$EUID" -ne 0 ]
#  then echo "ERROR: Please run as root"
#  exit
#fi
cp -f ~/printer_data/config/olli/boards/rp2040/firmware.config ~/klipper/.config
pushd ~/klipper
make olddefconfig
make clean
make

if [ ! -d ~/printer_data/config/binaries ]
then
    mkdir ~/printer_data/config/binaries
    chmod -v 755 ~/printer_data/config/binaries
fi
cp -f ~/klipper/out/klipper.uf2 ~/printer_data/config/binaries/rp2040.uf2
chmod -v 644 ~/printer_data/config/binaries/rp2040.uf2
popd
