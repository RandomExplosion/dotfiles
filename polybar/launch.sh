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

# BOTTOM BAR

# Add restart marker to log 
echo "---" | tee -a /tmp/polybar-b.log 
polybar -c "$DIR/generic-bars.ini" -r bottombar 2>&1 | tee -a /tmp/polybar-b.log & disown

# TOP BAR (Not included in this config but if you add one to generic-bars.ini uncomment these lines)

# Add restart marker to log
# echo "---" | tee -a /tmp/polybar-t.log
# polybar -c "$DIR/generic-bars.ini" -r topbar 2>&1 | tee -a /tmp/polybar-t.log

echo "Bars launched..."
