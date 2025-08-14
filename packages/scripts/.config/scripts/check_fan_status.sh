#! /bin/bash

CPU=$(sensors | awk '/cpu_fan/ {print $2}')
GPU=$(sensors | awk '/gpu_fan/ {print $2}')

# echo "󰈐 CPU: $CPU RPM | GPU: $GPU RPM"
if [[ "$CPU" = "0" && "$GPU" = "0" ]]; then
	echo "󰠝"
else
	echo "󰈐 $CPU $GPU"
fi
