#!/bin/bash
NEWU=$(ls -Art /tmp/raw_data_axis*_belt-tension-upper.csv | tail -n 1)
NEWL=$(ls -Art /tmp/raw_data_axis*_belt-tension-lower.csv | tail -n 1)
DATE=$(date +'%Y-%m-%d-%H%M%S')
if [ ! -d ~/printer_data/config/input_shaper ]; then
    mkdir ~/printer_data/config/input_shaper
#    #chown pi:pi /home/pi/printer_data/config/input_shaper
fi
~/klipper/scripts/graph_accelerometer.py -c "$NEWU" "$NEWL" -o ~/printer_data/config/input_shaper/belt-tension-resonances_$DATE.png

