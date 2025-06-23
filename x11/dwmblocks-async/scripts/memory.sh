#!/usr/bin/env bash

used_mem_mib=$(free -m | awk '/Mem:/ {print $3}')

used_mem_gib=$(echo "scale=2; $used_mem_mib / 1024" | bc)

echo "  ${used_mem_gib}GiB"

case "$BLOCK_BUTTON" in
    1) st -e btop ;;
esac
