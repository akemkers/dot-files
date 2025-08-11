#!/bin/bash

# Get mouse position from Hyprland
read X Y <<< "$(hyprctl cursorpos | sed 's/,/ /')"

    # --style="${HOME}.config/scripts/wofi-menu-style.css"\
# Show wofi menu near the cursor
CHOICE=$(echo -e "power-saver\nbalanced\nperformance" | rofi \
    -dmenu \
    --prompt "Power Profile" \
    --width 20 \
    --location center \
    --anchor "northwest" \
    --xoffset -5 \
    --yoffset -30 \
    --fixed-num-lines
)

# If user made a selection, apply the profile
if [[ -n "$CHOICE" ]]; then
    powerprofilesctl set "$CHOICE"
fi
