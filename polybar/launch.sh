#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Directory For Config Files
DIR="$HOME/.config/polybar"

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybarL.log /tmp/polybarR.log
#polybar -c "$DIR/config.ini" -r  bottombarL 2>&1 | tee -a /tmp/polybarL.log & disown
#polybar -c "$DIR/config.ini" -r  bottombarR 2>&1 | tee -a /tmp/polybarR.log & disown
polybar -c "$DIR/laptop.ini" -r bottombar 2>&1 | tee -a /tmp/polybarB.log & disown

echo "Bars launched..."
