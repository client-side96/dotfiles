#!/bin/bash -l

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title CARE
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🧬
# @raycast.packageName Kitty

# Documentation:
# @raycast.description Working Hours
# @raycast.author dominic_frey
# @raycast.authorURL https://raycast.com/dominic_frey

cd

# kitty -o allow_remote_control=yes --session ~/.config/kitty/sessions/care-app
open -a kitty.app -n --args --session ~/.config/kitty/sessions/care-app
# open -a kitty.app -n

echo "CARE project opened"
