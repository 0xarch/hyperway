#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source $SCRIPT_DIR/lib.sh

if is_dark_mode_now; then
  echo "[<span color='#ff00ff'>DARK</span>]"
else
  echo "[<span color='#00ffff'>LIGHT</span>]"
fi

