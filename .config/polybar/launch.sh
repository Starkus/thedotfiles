#!/usr/bin/env sh

killall -q polybar
killall -q lemonbar

polybar_proc=$(pgrep -u $UID -x polybar)

# Terminate already running bar instances
for i in ${polybar_proc} ; do
    kill -9 $i
done

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar top & bottom
polybar top &
polybar top-second &
#polybar bottom &

# Launch lemonbar empty for margin
exec_always lemonbar -g x42++ &

echo "Bars launched..."
