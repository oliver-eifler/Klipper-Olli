## Klipper extension modules

- __olli_homing__<br>
combination of safe_z_home and homing_override with user defined actions in place of a normal G28 (borrowed from RatOS)<br>
__Install__: `ln -s ~/printer_data/config/klippy/olli_homing.py ~/klipper/klippy/extras/olli_homing.py`<br>
__Remove__: `unlink ~/klipper/klippy/extras/olli_homing.py`<br>

- __gcode_shell_command__<br>
execute shell commands from gcode macros<br>
__Install__: `ln -s ~/printer_data/config/klippy/gcode_shell_command.py ~/klipper/klippy/extras/gcode_shell_command.py`<br>
__Remove__: `unlink ~/klipper/klippy/extras/olli_homing.py`<br>

- __olli_mesh__<br>
todo: will do a real adaptive mesh by mesh size and mesh point grid size

### avoid repository warning

in ~/klipper/.git/info/exclude<br>
add/remove
```
klippy/extras/olli_homing.py<br>
klippy/extras/gcode_shell_command.py<br>
```