# Klipper - Olli

<img align="right" width=128 src=".theme/sidebar-logo.svg" />

__For internal use only__

Klipper configuration for several printers with reuseable hardware configs, macros, scripts

## Printers

### Olli Moose
- Custom bed slinger 
- BTT Octopus V1.0, Raspberry Pad with CM4
- Independent dual Z
- Creality Sprite Pro extruder
- Creality CR-Touch
- Sensorless homing X/Y
- usb-adxl345

### ToDo - Olli Ender3 Pro
- Modified Ender 3 Pro
- SKR E3 Turbo Board, Raspberry PI3b, BTT TFT35 E3 - LCD12864 Mode only
- Independent dual Z
- Bondtech DDX with Copperhead Hotend
- Bl-Touch
- Sensorless homing X/Y
- usb-adxl345

### ToDo - Olli Doozer 
- Custom CoreXY 235x235x235
- BTT Manta M8P V2.0 with CB1, TFT35 SPI 2.0
- Independent triple Z

__Install__: 
```
ln -s ~/printer_data/config/klippy/gcode_shell_command.py ~/klipper/klippy/extras/gcode_shell_command.py
ln -s ~/printer_data/config/klippy/olli_homing.py ~/klipper/klippy/extras/olli_homing.py
cp ~/printer_data/config/printers/moose/printer.tpl ~/printer_data/config/printer.cfg
```
