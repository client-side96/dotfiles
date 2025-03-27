#!/usr/bin/env bash

echo "NAME: $NAME"
echo "FOCUSED: $FOCUSED_WORKSPACE"
if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
  sketchybar --set $NAME icon.color=0xc4a7e7ff
else
  sketchybar --set $NAME icon.color=0xffffffff
fi
