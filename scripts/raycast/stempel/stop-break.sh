#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Stop break
# @raycast.mode silent

# Optional parameters:
# @raycast.icon ⏳
# @raycast.argument1 { "type": "text", "placeholder": "Offset", "optional": true }
# @raycast.packageName Stempel

# Documentation:
# @raycast.description Stop break
# @raycast.author dominic_frey
# @raycast.authorURL https://raycast.com/dominic_frey

OFFSET=$1

stempel=$HOME/.cargo/bin/stempel

if [ -n "$OFFSET" ]; then
    $stempel break stop --offset $OFFSET
else
    $stempel break stop
fi
