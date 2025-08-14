#!/bin/bash

CACHE_DIR="$HOME/.cache/package-updates"
CACHE_FILE="$CACHE_DIR/count"
CACHE_TTL=600 # seconds (10 minutes)

mkdir -p "$CACHE_DIR"

# If cache file exists and is fresh enough, just print it
if [[ -f "$CACHE_FILE" && $(( $(date +%s) - $(stat -c %Y "$CACHE_FILE") )) -lt $CACHE_TTL ]]; then
    cat "$CACHE_FILE"
    exit 0
fi

# Otherwise, fetch fresh counts
pacmanUpdates=$(pacman -Qu | wc -l)
aurUpdates=$(yay -Qu --aur --quiet | wc -l)

total=$((pacmanUpdates + aurUpdates))

# Save to cache and print
echo "$total" > "$CACHE_FILE"
echo "$total"
