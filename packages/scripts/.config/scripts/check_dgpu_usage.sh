#! /bin/bash



# output=$(nvidia-smi --query-gpu=utilization.gpu,temperature.gpu --format=csv,nounits,noheader )
#
#
# if [[ $? -eq 0 ]]; then 
# 	echo $(output | sed 's/\\([0-9]\\+\\), \\([0-9]\\+\\)/\\1% 🌡️\\2°C/g') 
# else 
# 	echo "Nvidia Disabled"
# fi


ICON="󰬕"

if [[ -d /proc/driver/nvidia/gpus/ ]]; then
    # Green when enabled
    echo "<span color='#76b900'>$ICON</span>"
else
    # Red when disabled
    echo "<span color='#ff5555'>$ICON</span>"
fi
