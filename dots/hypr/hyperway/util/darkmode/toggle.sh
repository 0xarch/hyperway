#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source $SCRIPT_DIR/lib.sh

MODE=$DARK_MODE_SIG
QT_MODE="BreezeDark"

if is_dark_mode_now; then
  MODE=$LIGHT_MODE_SIG
  QT_MODE="BreezeLight"
fi

gsettings set org.gnome.desktop.interface color-scheme "$MODE"
if which plasma-apply-colorscheme; then
  plasma-apply-colorscheme "$QT_MODE"
fi

bash $SCRIPT_DIR/wallpaper.sh

kill -SIGRTMIN+30 $(pgrep waybar)
