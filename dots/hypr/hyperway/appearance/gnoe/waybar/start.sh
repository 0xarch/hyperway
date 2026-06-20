#!/bin/sh

CONFIG_DIR=$HOME/.config/hypr/hyperway/appearance/gnoe/waybar/
COUNT=$HYPERWAY_WORKSPACE_COUNT

PARSED_CONFIG=/tmp/hyperway/$(date +%H%M%S)/waybarconfig.jsonc

if [ "$COUNT" == "" ]; then
  COUNT=10
fi

workspace_list=""
workspace_conf=""
for i in $(seq 1 $COUNT); do
  workspace_list+="\"custom/workspace#ws$i\","
  workspace_conf+="\"custom/workspace#ws$i\": { \"on-scroll-down\": \"hyprctl dispatch 'hl.dsp.focus({workspace=\\\\\\\"+1\\\\\\\"})'\", \"on-scroll-up\": \"hyprctl dispatch 'hl.dsp.focus({workspace=-1})'\", \"on-click\": \"hyprctl dispatch 'hl.dsp.focus({workspace=$i})'\", \"exec\": \"$HOME/.config/hypr/hyperway/util/workspace/waybar_output $i\", \"signal\": 29},"
done

mkdir -p $(dirname $PARSED_CONFIG)

cp $CONFIG_DIR/config.jsonc $PARSED_CONFIG

sed -i "s|%%WORKSPACE_LIST%%|$workspace_list|" $PARSED_CONFIG
sed -i "s|%%WORKSPACE%%|$workspace_conf|" $PARSED_CONFIG

waybar -c "$PARSED_CONFIG" -s "$CONFIG_DIR/style.css"

# rm $PARSED_CONFIG
