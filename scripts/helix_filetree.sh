#!/bin/bash

right_pane_id=$(wezterm cli get-pane-direction right)
if [ -z "${right_pane_id}" ]; then
  right_pane_id=$(wezterm cli split-pane --right --percent 20)
fi
right_program=$(wezterm cli list | awk -v pane_id="$right_pane_id" '$3==pane_id { print $6 }')
if [ "$right_program" != "Yazi:" ]; then
  echo "yazi" | wezterm cli send-text --pane-id $right_pane_id --no-paste
fi
wezterm cli activate-pane-direction right
