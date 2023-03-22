#!/usr/bin/env zsh

monitor="/sys/class/backlight/intel_backlight/actual_brightness"
max="/sys/class/backlight/intel_backlight/max_brightness"
nit_current=$(<"$monitor")

function nit_percent () {
    echo $((nit_current / max_brightness) * 100)
}

nit_percent

inotifywait -q -m -e modify "$monitor" --format "%e" | while read -r _; do
    nit_current=$(<"$monitor")
    nit_percent
done