#!/bin/bash
# build klipper host mcu firmware emulation
cp -f ~/printer_data/config/boards/host/firmware.config ~/klipper/.config
pushd ~/klipper
make olddefconfig
make clean
make
sudo service klipper stop
make flash
sudo service klipper start
popd
