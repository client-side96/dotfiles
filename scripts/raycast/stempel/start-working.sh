#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Start working
# @raycast.mode silent

# Optional parameters:
# @raycast.icon ⏳
# @raycast.argument1 { "type": "text", "placeholder": "Offset", "optional": true }
# @raycast.packageName Stempel

# Documentation:
# @raycast.description Start working
# @raycast.author dominic_frey
# @raycast.authorURL https://raycast.com/dominic_frey

OFFSET=$1

stempel=$HOME/.cargo/bin/stempel

if [ -n "$OFFSET" ]; then
    $stempel start --offset $OFFSET
else
    $stempel start
fi
