#!/usr/bin/env bash

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
  sketchybar --set $NAME icon.highlight=on label.highlight=on
else
  sketchybar --set $NAME icon.highlight=off label.highlight=off
fi

