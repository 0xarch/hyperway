#!/bin/sh

CONFIG_DIR=$HOME/.config/hypr/hyperway/appearance/swaylike/waybar/
COUNT=$HYPERWAY_WORKSPACE_COUNT

PARSED_CONFIG=/tmp/hyperway/$(date +%H%M%S)/waybarconfig.jsonc

if [ "$COUNT" -eq ""]; then
  COUNT=10
fi

persistent_json=""
workspace_list=""
workspace_conf=""
# persistent_json="{"
for i in $(seq 1 $COUNT); do
  persistent_json+="\"$i\": true, "
  workspace_list+="\"custom/workspace#$i\","
  workspace_conf+="\"custom/workspace#$i\": { \"on-scroll-down\": \"hyprctl dispatch 'hl.dsp.focus({workspace=\\\\\\\"+1\\\\\\\"})'\", \"on-scroll-up\": \"hyprctl dispatch 'hl.dsp.focus({workspace=-1})'\", \"on-click\": \"hyprctl dispatch 'hl.dsp.focus({workspace=$i})'\", \"exec\": \"\$HOME/.config/hypr/hyperway/util/workspace/waybar_output $i\", \"signal\": 29},"
done
persistent_json=${persistent_json%, }
# persistent_json+="}"

mkdir -p $(dirname $PARSED_CONFIG)

cp $CONFIG_DIR/config.jsonc $PARSED_CONFIG

sed -i "s|%%PERSISTENT%%|$persistent_json|" $PARSED_CONFIG
sed -i "s|%%WORKSPACE_LIST%%|$workspace_list|" $PARSED_CONFIG
sed -i "s|%%WORKSPACE%%|$workspace_conf|" $PARSED_CONFIG

waybar -c "$PARSED_CONFIG" -s "$CONFIG_DIR/style.css"

# rm $PARSED_CONFIG
