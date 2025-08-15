#! /bin/bash

# output=$(nvidia-smi --query-gpu=utilization.gpu,temperature.gpu --format=csv,nounits,noheader )
#
#
# if [[ $? -eq 0 ]]; then 
# 	echo $(output | sed 's/\\([0-9]\\+\\), \\([0-9]\\+\\)/\\1% 🌡️\\2°C/g') 
# else 
# 	echo "Nvidia Disabled"
# fi


TEXT="󰬕"

if [[ -d /proc/driver/nvidia/gpus/ ]]; then
    CLASS="enabled"
else
	CLASS="disabled"
fi

jq --unbuffered --compact-output --null-input \
    --arg text "$TEXT" \
    --arg class "$CLASS" \
    '{
        "text": $text,
        "class": $class,
    }'
