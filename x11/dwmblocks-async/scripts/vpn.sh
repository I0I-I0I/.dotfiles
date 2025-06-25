#!/usr/bin/env bash

echo "$(vpn st --json | jq -r .text 2>/dev/null) "

case "$BLOCK_BUTTON" in
    1) vpn tog ;;
esac
