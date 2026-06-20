#!/bin/sh

CONFIG_DIR=$HOME/.config/hypr/hyperway/appearance/swaypure/waybar/

waybar -c "$CONFIG_DIR/config.jsonc" -s "$CONFIG_DIR/style.css"
