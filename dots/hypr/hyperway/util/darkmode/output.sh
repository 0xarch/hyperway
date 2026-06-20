#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source $SCRIPT_DIR/lib.sh

if is_dark_mode_now; then
  echo "<span color='#aa44ff'> 󰖔 </span>"
else
  echo "<span color='#ffff44'> 󰖙 </span>"
fi
