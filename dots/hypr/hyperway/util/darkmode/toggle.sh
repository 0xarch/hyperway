#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source $SCRIPT_DIR/lib.sh

MODE=$DARK_MODE_SIG

if is_dark_mode_now; then
    MODE=$LIGHT_MODE_SIG
fi

gsettings set org.gnome.desktop.interface color-scheme "$MODE"

pkill -RTMIN+77 waybar