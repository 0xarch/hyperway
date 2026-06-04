#!/bin/sh

CONFIG_DIR=$HOME/.config/hypr/hyperway/appearance/swaylike/waybar/
COUNT=$HYPERWAY_WORKSPACE_COUNT

PARSED_CONFIG=/tmp/hyperway/$(date +%H%M%S)/waybarconfig.jsonc

if [ "$COUNT" -eq ""]; then
  COUNT=10
fi

persistent_json=""
# persistent_json="{"
for i in $(seq 1 $COUNT); do
  persistent_json+="\"$i\": true, "
done
persistent_json=${persistent_json%, }
# persistent_json+="}"

mkdir -p $(dirname $PARSED_CONFIG)

cp $CONFIG_DIR/config.jsonc $PARSED_CONFIG

sed -i "s|%%PERSISTENT%%|$persistent_json|" $PARSED_CONFIG

waybar -c "$PARSED_CONFIG" -s "$CONFIG_DIR/style.css"

# rm $PARSED_CONFIG
