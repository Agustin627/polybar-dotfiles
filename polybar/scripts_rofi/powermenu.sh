#!/bin/bash

dir="~/.config/polybar/scripts_rofi/rofi"
rofi_command="rofi -theme $dir/themes/style_PowerMenu.rasi"

# options to be displyed
logout="  Cerrar Sesion"
suspend="  Suspender"
reboot="  Reiniciar"
shutdown="  Apagar"

# Variable passed to rofi
options="$shutdown\n$reboot\n$suspend\n$logout"

selected="$(echo -e "$options" | $rofi_command -p "WARNING: unsaved changes will be lost" -dmenu -selected-row 0)"
case $selected in
    $logout)
        pkill bspwm;;
    $suspend)
        pm-suspend-hybrid;;
    $reboot)
        reboot;;
    $shutdown)
        shutdown now;;
esac
