#!/bin/bash
#if [ "$EUID" -ne 0 ]
#  then echo "ERROR: Please run as root"
#  exit
#fi
MCU=/dev/serial/by-id/usb-Klipper_stm32h723xx_17003B001051313236343430-if00
cp -f ~/printer_data/config/boards/manta-m8p-v2/firmware.config  ~/klipper/.config
pushd ~/klipper
make olddefconfig
make clean
sudo service klipper stop
dfuDevicesPreFlash=$(lsusb | grep -c "0483:df11")
if [ -h "$MCU" ]; then
    echo "Flashing $MCU"
    #sudo make flash FLASH_DEVICE="$MCU"
    make flash FLASH_DEVICE="$MCU"
fi
sleep 5
retVal=1
if [ -h "$MCU" ]; then
	retVal=0
else
	dfuDevicesPostFlash=$(lsusb | grep -c "0483:df11")
	if [ "$dfuDevicesPreFlash" -eq 0 ] && [ "$dfuDevicesPostFlash" -eq 1 ]; then
		echo "Seems like flashing failed, but the device is still in DFU mode. Attempting to recover."
		make flash FLASH_DEVICE=0483:df11
		sleep 5
		if [ -h "$MCU" ]; then
			retVal=0
		fi
	fi
fi
if [ $retVal -eq 0 ]; then
	echo "Flashing successful."
else
	echo "Flashing failed."
fi
#chown pi:pi -R /home/pi/klipper
sudo service klipper start
popd
exit $retValpopd
