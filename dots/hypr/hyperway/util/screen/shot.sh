#!/bin/bash

SAVE_PATH="Screenshots/$(date +%Y-%m-%d_%H-%M-%S).png"
mkdir -p $(xdg-user-dirs PICTURES)/$(dirname "$SAVE_PATH")
hyprshot $1 -f "$SAVE_PATH"
