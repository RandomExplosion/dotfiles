#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Directory For Config Files
DIR="$HOME/.config/polybar"

###############
# LAUNCH BARS #
###############

# BOTTOM LEFT BAR

# Add restart marker to log 
echo "---" | tee -a /tmp/polybar-bl.log 
polybar -c "$DIR/desktop.ini" -r bottomleftbar 2>&1 | tee -a /tmp/polybar-bl.log

# BOTTOM RIGHT BAR

# Add restart marker to log 
echo "---" | tee -a /tmp/polybar-br.log 
polybar -c "$DIR/desktop.ini" -r bottomrightbar 2>&1 | tee -a /tmp/polybar-br.log

echo "Bars launched..."
