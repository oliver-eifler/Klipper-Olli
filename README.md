# Klipper - Olli

<img align="right" width=128 src=".theme/sidebar-logo.svg" />

__For internal use only__

## Olli Moose

### Custom 310x310x400 bed slinger

- BTT Octopus V1.0, Raspberry Pad with CM4
- Independent dual Z
- E3D Revo Hotend
- LDO Orbit v2.0 Extruder with Orbiter Filament Sensor
- Apogee print head
- Sensorless homing X/Y
- BTT Microprobe V2
- usb-adxl345

__Install__: 
```
ln -s ~/printer_data/config/klippy/gcode_shell_command.py ~/klipper/klippy/extras/gcode_shell_command.py
ln -s ~/printer_data/config/klippy/olli_homing.py ~/klipper/klippy/extras/olli_homing.py
cp ~/printer_data/config/printers/moose/printer.tpl ~/printer_data/config/printer.cfg
```
