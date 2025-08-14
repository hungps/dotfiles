#!/bin/bash

# Send event to sketchybar
sketchybar --trigger aerospace_workspace_change FOCUSED_WORKSPACE=$AEROSPACE_FOCUSED_WORKSPACE

# Move PiP windows to current workspace (handles both "Picture-in-Picture" and "Picture in Picture")
current_workspace=$(aerospace list-workspaces --focused)
aerospace list-windows --all | grep -E "(Picture-in-Picture|Picture in Picture)" | awk '{print $1}' | while read window_id; do
    if [ -n "$window_id" ]; then
        aerospace move-node-to-workspace --window-id "$window_id" "$current_workspace"
    fi
done
