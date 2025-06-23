#!/usr/bin/env bash

cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')

cpu_freq=$(cat /proc/cpuinfo | grep "cpu MHz" | awk '{sum+=$4; count++} END {printf "%.0f", sum/count}')

echo " ${cpu_usage}% ${cpu_freq}MHz"

case "$BLOCK_BUTTON" in
    1) st -e btop ;;
esac
