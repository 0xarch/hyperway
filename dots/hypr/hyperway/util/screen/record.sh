#!/bin/bash

pkill wf-recorder

IS_RECORDER_ALIVE=$?

if [ "$IS_RECORDER_ALIVE" == "0" ]; then
  notify-send "Recording stopped at $(date)"
else
  SAVE_PATH="$(xdg-user-dir VIDEOS)/ScreenCaptures/$(date +%Y-%m-%d_%H-%M-%S).mp4"
  mkdir $(dirname "$SAVE_PATH")
  notify-send "Recording started at $(date)"
  wf-recorder -a -f "$SAVE_PATH"
fi
