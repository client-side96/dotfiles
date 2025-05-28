#!/usr/bin/env bash

focused_window=$(aerospace list-windows --focused | cut -d'|' -f2)

sketchybar --set $NAME label="$focused_window" icon="􁑭"
