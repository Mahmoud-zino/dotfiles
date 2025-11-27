#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until processes shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bars - they will use the monitor specified in config.ini
polybar main -c ~/.config/polybar/config.ini 2>&1 | tee -a /tmp/polybar-main.log & disown
polybar secondary -c ~/.config/polybar/config.ini 2>&1 | tee -a /tmp/polybar-secondary.log & disown

echo "Polybar launched on both monitors..."
