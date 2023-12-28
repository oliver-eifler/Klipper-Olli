# OLLI-Moose
# todo: olli printer install.sh
[include mainsail.cfg]
[include macros/config_backup.cfg]
[include macros/debug.cfg]
[include macros/util.cfg]
[include macros/macros.cfg]
[include macros/homing.cfg]

[virtual_sdcard]
#path: /home/pi/printer_data/gcodes
on_error_gcode: CANCEL_PRINT

[save_variables]
filename: ~/printer_data/config/saved_variables.cfg

#hardware
[include boards/octopus10-446/board.cfg]
[include extruders/orbiter20.cfg]
[include probes/microprobe_v2.cfg]
#[include extras/usb-adxl345.cfg]
#[include macros/shaper.cfg]

#printer
[include printers/moose/moose.cfg]

# board Octopus V1.0 (STM32F446)
[mcu]
serial: /dev/serial/by-id/usb-Klipper_stm32f446xx_460024000B50534841313020-if00

#klipper host
[temperature_sensor CM4]
sensor_type: temperature_host
min_temp: 10
max_temp: 100

[temperature_sensor Ambiente]
sensor_pin: TEMP_3_PIN
sensor_type: Generic 3950 # EPCOS 100K B57560G104F
min_temp: -10
max_temp: 100

# Debug
[force_move]
enable_force_move: True

[idle_timeout]
gcode:
  {% if printer.pause_resume.is_paused %}
    M104 S0
  {% else %}
    TURN_OFF_HEATERS
    M84
  {% endif %}

#[input_shaper]
#shaper_freq_x: 53.4 #acc: 8400
#shaper_type_x: mzv
#shaper_freq_y: 23.6 #acc: 1800
#shaper_type_y: mzv

# override, neede for SAVE_CONFIG
[extruder]
control: pid
pid_Kp:   19.709 
pid_Ki:    1.011 
pid_Kd:   96.082

[heater_bed]
control: pid
pid_Kp:   72.009 
pid_Ki:    1.165 
pid_Kd: 1112.538

[probe]
z_offset: 0 #1.1
