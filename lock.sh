#!/bin/bash
# i3lock with blurred background

# Image path
IMAGE=/usr/share/backgrounds/guts.png

# Check if image exists
if [ ! -f "$IMAGE" ]; then
    echo "Image not found: $IMAGE"
    exit 1
fi

# Get screen resolution
SCREEN_WIDTH=$(xdpyinfo | awk '/dimensions/{print $2}' | cut -d 'x' -f1)
SCREEN_HEIGHT=$(xdpyinfo | awk '/dimensions/{print $2}' | cut -d 'x' -f2)

# Temporary blurred image
TMP_BG="/tmp/i3lock_blur.png"

# Resize, crop, and blur
convert "$IMAGE" -resize "${SCREEN_WIDTH}x${SCREEN_HEIGHT}^" \
    -gravity center -crop "${SCREEN_WIDTH}x${SCREEN_HEIGHT}+0+0" \
    -blur 0x8 "$TMP_BG"

# Lock screen with blurred image
i3lock -i "$TMP_BG" --nofork

# Clean up
rm "$TMP_BG"

