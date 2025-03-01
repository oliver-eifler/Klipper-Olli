#!/bin/bash
#if [ "$EUID" -ne 0 ]
#  then echo "ERROR: Please run as root"
#  exit
#fi
cp -f ~/printer_data/config/olli/boards/manta-e3ez/firmware.config  ~/klipper/.config
pushd ~/klipper
make olddefconfig
make clean
sudo service klipper stop
make flash FLASH_DEVICE=/dev/serial/by-id/usb-Klipper_stm32g0b1xx_400033000C504B5735313920-if00
sudo service klipper start
popd
