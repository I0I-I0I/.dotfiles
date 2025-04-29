#!/usr/bin/env bash

if ! pgrep "ulauncher"; then
    ulauncher;
else
    exec ulauncher-toggle
fi
