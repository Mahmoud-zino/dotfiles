#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Get all connected monitors
monitors=$(xrandr --query | grep " connected" | cut -d" " -f1)

# Count monitors
monitor_count=$(echo "$monitors" | wc -l)

echo "Found $monitor_count monitor(s)"

# Check if battery exists
if [ -d "/sys/class/power_supply/BAT0" ] || [ -d "/sys/class/power_supply/BAT1" ]; then
    echo "Battery detected - enabling battery module"
    export SHOW_BATTERY=true
else
    echo "No battery detected - disabling battery module"
    export SHOW_BATTERY=false
fi

if [ "$monitor_count" -eq 1 ]; then
    # Single monitor - launch main bar only
    MONITOR=$(echo "$monitors" | head -n 1) polybar main 2>&1 | tee -a /tmp/polybar-main.log & disown
    echo "Launched polybar on single monitor: $(echo $monitors | head -n 1)"
else
    # Multiple monitors - launch on each
    for monitor in $monitors; do
        MONITOR=$monitor polybar main 2>&1 | tee -a /tmp/polybar-$monitor.log & disown
        echo "Launched polybar on: $monitor"
    done
fi

echo "Polybar launched!"
