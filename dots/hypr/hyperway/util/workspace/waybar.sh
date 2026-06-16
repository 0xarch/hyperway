#!/bin/bash

INDEX=$1

if [ "$INDEX" == "" ]; then
  exit 0
fi

ACTIVE=$(hyprctl activeworkspace -j | jq -cr .id)

if [ "$INDEX" == "$ACTIVE" ]; then
  echo "<span color='#00ff00'>[</span>${INDEX}<span color='#00ff00'>]</span>"
else

  echo "<span> ${INDEX} </span>"
fi
