#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
# polybar-msg cmd quit
# Otherwise you can use the nuclear option:
killall -q polybar

# Launch bar1 and bar2
echo "---" | tee -a /tmp/bar_left.log /tmp/bar_left-b.log /tmp/bar_left-c.log /tmp/bar_mid.log /tmp/bar_right.log
polybar left 2>&1 | tee -a /tmp/bar_left.log & disown
polybar left-b 2>&1 | tee -a /tmp/bar_left-b.log & disown
polybar left-c 2>&1 | tee -a /tmp/bar_left-c.log & disown
polybar mid 2>&1 | tee -a /tmp/bar_mid.log & disown
polybar right 2>&1 | tee -a /tmp/bar_right.log & disown

echo "Bars launched..."