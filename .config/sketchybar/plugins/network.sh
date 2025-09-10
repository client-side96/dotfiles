#!/usr/bin/env bash

net=$(ipconfig getsummary en0 | awk -F'SSID :' '{print $2}' | xargs | cut -d ' ' -f2)

sketchybar --set $NAME label="$net" icon="􀙇"
