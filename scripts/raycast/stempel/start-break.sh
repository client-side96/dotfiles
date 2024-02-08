#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Start break
# @raycast.mode silent

# Optional parameters:
# @raycast.icon ⏳
# @raycast.argument1 { "type": "text", "placeholder": "Offset", "optional": true }
# @raycast.packageName Stempel

# Documentation:
# @raycast.description Start break
# @raycast.author dominic_frey
# @raycast.authorURL https://raycast.com/dominic_frey

OFFSET=$1

stempel=$HOME/.cargo/bin/stempel

if [ -n "$OFFSET" ]; then
    $stempel break start --offset $OFFSET
else
    $stempel break start
fi
