#!/usr/bin/env bash

set_bar() {
  sketchybar --set $NAME label.color=$1 icon.color=$1
}

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
  set_bar $2
else
  set_bar $3
fi
