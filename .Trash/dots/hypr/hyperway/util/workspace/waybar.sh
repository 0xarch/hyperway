#!/bin/bash

INDEX=$1

if [ "$INDEX" == "" ]; then
  exit 0
fi

ACTIVE=$(hyprctl activeworkspace -j | jq -cr .id)

VALUE=$(awk -v id="$INDEX" '$1 == id {print $2; exit}' /tmp/hyperway/workspace_state)

if [ -n "$VALUE" ]; then
  if [ "$INDEX" == "$ACTIVE" ]; then
    CHAR_A="<span color='#44ff44'>"
  else
    CHAR_A="<span color='#eeeeee'>"
  fi
  case "$VALUE" in
  "kitty")
    CHAR_B="  "
    ;;
  "chromium")
    CHAR_B="  "
    ;;
  "QQ")
    CHAR_B="  "
    ;;
  "neovide")
    CHAR_B="  "
    ;;
  "magicavoxel.exe")
    CHAR_B="  "
    ;;
  *)
    CHAR_B="$(printf "%03s" ${VALUE:0:3})"
    ;;
  esac
  CHAR_C=" </span>"
else
  if [ "$INDEX" == "$ACTIVE" ]; then
    CHAR_A="<span color='#00ff00'>["
    if [ "$INDEX" == "10" ]; then
      CHAR_C="]</span>"
    else
      CHAR_C="]</span> "
    fi
  else
    CHAR_A="<span color='#aaaaaa'> "
    if [ "$INDEX" == "10" ]; then
      CHAR_C="</span> "
    else
      CHAR_C="</span>  "
    fi
  fi
  CHAR_B="$INDEX"
fi

# if [ "$INDEX" == "$ACTIVE" ]; then
#  echo "${CHAR_A}</span>${CHAR_B}<span color='#00ff00'>${CHAR_C}</span>"
#else
echo "<span>${CHAR_A}${CHAR_B}${CHAR_C}</span>"
#fi
