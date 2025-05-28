#!/bin/bash

battery=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)

sketchybar --set $NAME label="$battery%" icon="􀛨"
