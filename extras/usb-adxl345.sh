#!/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "ERROR: Please run as root"
  exit
fi
cp -f /home/pi/printer_data/config/extras/usb-adxl345.config /home/pi/klipper/.config
pushd /home/pi/klipper
make olddefconfig
make clean
make

if [ ! -d "/home/pi/printer_data/config/binaries" ]
then
    mkdir /home/pi/printer_data/config/binaries
    chown pi:pi /home/pi/printer_data/config/binaries
fi
cp -f /home/pi/klipper/out/klipper.bin /home/pi/printer_data/config/binaries/firmware-usb-adxl345.bin
chown pi:pi /home/pi/printer_data/config/binaries/firmware-usb-adxl345.bin
popd
