#!/usr/bin/env bash

SOCK="$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock"

socat -U - UNIX-CONNECT:"$SOCK" |
  while IFS= read -r line; do
    [[ $line == workspacev2* ]] && pkill -SIGRTMIN+29 waybar
  done
