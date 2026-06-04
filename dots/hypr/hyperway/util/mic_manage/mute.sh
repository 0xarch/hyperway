#!/bin/bash

pactl set-source-mute "@DEFAULT_SOURCE@" toggle

ICON='audio-input-microphone-symbolic'

if [ "$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | awk '{print $3}')" == "[MUTED]" ]; then
    TEXT='[MUTED]'
    swayosd-client --custom-icon "$ICON" --custom-message "[MUTED]"
else
    TEXT="$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | awk '{print $2}')"
    PROGRESS="--custom-progress $(echo "scale=2; $TEXT / 1 * 100" | bc)"
    TEXT="$(echo "scale=0; $TEXT * 100 / 1" | bc)%"
    swayosd-client --custom-icon "$ICON" --custom-progress-text "$TEXT" $PROGRESS
fi
