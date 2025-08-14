#!/bin/bash

# Configuration
MAX_FAN_SPEED=6000
MIN_FAN_SPEED=0

# Get fan speeds and remove 'RPM' suffix if present
CPU_RAW=$(sensors | awk '/cpu_fan/ {gsub(/[^0-9]/, "", $2); print $2}')
GPU_RAW=$(sensors | awk '/gpu_fan/ {gsub(/[^0-9]/, "", $2); print $2}')

# Default to 0 if sensors return empty/invalid values
CPU=${CPU_RAW:-0}
GPU=${GPU_RAW:-0}

# Calculate average fan speed
AVERAGE=$(( (CPU + GPU) / 2 ))

# Calculate percentage (0-100)
if [[ $AVERAGE -ge $MAX_FAN_SPEED ]]; then
    PERCENTAGE=100
elif [[ $AVERAGE -le $MIN_FAN_SPEED ]]; then
    PERCENTAGE=0
else
    PERCENTAGE=$(( (AVERAGE * 100) / MAX_FAN_SPEED ))
fi

# Determine icon state
if [[ $AVERAGE -eq 0 ]]; then
    ALT="off"
else
    ALT="on"
fi

# Determine CSS class based on fan speed ranges
if [[ $PERCENTAGE -eq 0 ]]; then
    CLASS="fan-off"
elif [[ $PERCENTAGE -le 33 ]]; then
    CLASS="fan-low"
elif [[ $PERCENTAGE -le 66 ]]; then
    CLASS="fan-medium"
else
    CLASS="fan-high"
fi

# Format display text
if [[ $AVERAGE -eq 0 ]]; then
    TEXT=""
else
    TEXT="$CPU/$GPU"
fi

# Create tooltip with detailed information
TOOLTIP="CPU: ${CPU} RPM\nGPU: ${GPU} RPM\nAverage: ${AVERAGE} RPM (${PERCENTAGE}%)"

# Output JSON
# Create JSON object and output using jq for proper formatting
jq --unbuffered --compact-output --null-input \
    --arg text "$TEXT" \
    --arg alt "$ALT" \
    --arg tooltip "$TOOLTIP" \
    --arg class "$CLASS" \
    --argjson percentage "$PERCENTAGE" \
    '{
        "text": $text,
        "alt": $alt,
        "tooltip": $tooltip,
        "class": $class,
        "percentage": $percentage
    }'
