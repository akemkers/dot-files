#!/bin/bash

# Check if the window exists
if hyprctl clients | grep -q 'class: yazi-float'; then
    hyprctl dispatch focuswindow class:yazi-float
else
    # Launch yazi in kitty with custom class
    kitty --class yazi-float -e yazi &
fi
