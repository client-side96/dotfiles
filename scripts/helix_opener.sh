#!/bin/bash

fpath="$1"

pane_id=$(wezterm cli get-pane-direction left)
if [ -z "${pane_id}" ]; then
  pane_id=$(wezterm cli split-pane --left --percent 80)
fi

program=$(wezterm cli list | awk -v pane_id="$pane_id" '$3==pane_id { print $6 }')
if [ "$program" = "hx" ]; then
  echo -e ":open ${fpath}\r" | wezterm cli send-text --pane-id $pane_id --no-paste
else
  echo "hx ${fpath}" | wezterm cli send-text --pane-id $pane_id --no-paste
fi

wezterm cli activate-pane-direction --pane-id $pane_id left 
