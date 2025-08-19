#!/usr/bin/env sh

sketchybar --set "$NAME" label.padding_left=0 \
                         icon.drawing=off \
                         label.drawing=off \
                         background.drawing=off

STATUS_LABEL=$(lsappinfo info -only StatusLabel "$1")
if [[ $STATUS_LABEL =~ \"label\"=\"([^\"]*)\" ]]; then
    LABEL="${BASH_REMATCH[1]}"

    if [[ $LABEL == "•" ]] || [[ $LABEL =~ ^[0-9]+$ ]]; then
      sketchybar --set "$NAME" label="$LABEL" icon.drawing=on label.drawing=on background.drawing=on
    fi
fi

