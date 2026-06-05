#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source $SCRIPT_DIR/lib.sh

WALLPAPER=$HYPERWAY_APPEARANCE_WALLPAPER_LIGHT

if is_dark_mode_now; then
  WALLPAPER=$HYPERWAY_APPEARANCE_WALLPAPER_DARK
fi

if [ "$WALLPAPER" != "" ]; then
  PREV_PROC=$(pgrep swaybg)
  (
    swaybg -m fill -i "$WALLPAPER"
    sleep 0.1
    kill $PREV_PROC
  ) &
  disown -h
fi

exit 0
