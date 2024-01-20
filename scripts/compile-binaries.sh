#!/bin/bash

compile_octopus10-446() {
    echo "Compiling firmware for BTT Octopus 1.0 446"
    cp -f /home/pi/printer_data/config/boards/octopus10-446/firmware.config /home/pi/klipper/.config
    make olddefconfig
    make clean
    make
    cp -f /home/pi/klipper/out/klipper.bin /home/pi/printer_data/config/binaries/firmware-octopus10-446.bin
}

compile_usb-adxl345() {
    echo "Compiling firmware for USB-ADXL345"
    cp -f /home/pi/printer_data/config/extras/usb-adxl345.config /home/pi/klipper/.config
    make olddefconfig
    make clean
    make
    cp -f /home/pi/klipper/out/klipper.bin /home/pi/printer_data/config/binaries/firmware-usb-adxl345.bin
}

# Force script to exit if an error occurs
set -e

# create binaries folder if not exists
if [ ! -d "/home/pi/printer_data/config/binaries" ]
then
    mkdir /home/pi/printer_data/config/binaries
    chown pi:pi /home/pi/printer_data/config/binaries
fi


pushd /home/pi/klipper
#SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
#cd /home/pi/klipper
# Run make scripts for the supported boards.
compile_octopus10-446
compile_usb-adxl345
chown pi:pi /home/pi/printer_data/config/binaries/*.bin

popd
#cd $SCRIPT_DIR