#!/bin/bash
export XKB_DEFAULT_LOCALE=en_US.UTF-8

# Set image path
IMAGE=/usr/share/backgrounds/1387849.png

# Get screen resolution
SCREEN_WIDTH=$(xdpyinfo | awk '/dimensions/{print $2}' | cut -d 'x' -f1)
SCREEN_HEIGHT=$(xdpyinfo | awk '/dimensions/{print $2}' | cut -d 'x' -f2)

# Resize, crop, and blur the image (to mimic --bg-fill)
convert "$IMAGE" -resize "${SCREEN_WIDTH}x${SCREEN_HEIGHT}^" -gravity center -crop "${SCREEN_WIDTH}x${SCREEN_HEIGHT}+0+0" -blur 0x5 /tmp/screen_locked_blur.png

# Lock the screen with the modified image
i3lock -i /tmp/screen_locked_blur.png --nofork

# Clean up temporary file
rm /tmp/screen_locked_blur.png

