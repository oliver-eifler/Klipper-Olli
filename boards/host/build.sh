#!/bin/bash
# build klipper host mcu firmware emulation
cp -f /home/pi/printer_data/config/boards/host/firmware.config /home/pi/klipper/.config
pushd /home/pi/klipper
make olddefconfig
make clean
make
sudo service klipper stop
make flash
sudo service klipper start
popd
