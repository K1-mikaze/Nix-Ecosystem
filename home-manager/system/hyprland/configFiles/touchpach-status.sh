#!/bin/sh

# Set the path for the status file
export STATUS_FILE="$XDG_RUNTIME_DIR/touchpad.status"

# Function to enable the touchpad
enable_touchpad() {
    printf "true" > "$STATUS_FILE"
    notify-send -u low "Enabling Touchpad"
    hyprctl keyword "device[elan1205:00-04f3:30e9-touchpad]:enabled" true
}

# Function to disable the touchpad
disable_touchpad() {
    printf "false" > "$STATUS_FILE"
    notify-send -u low "Disabling Touchpad"
    hyprctl keyword "device[elan1205:00-04f3:30e9-touchpad]:enabled" false
}

# Check the current status and toggle accordingly
if ! [ -f "$STATUS_FILE" ]; then
    enable_touchpad
else
    if [ "$(cat "$STATUS_FILE")" = "true" ]; then
        disable_touchpad
    elif [ "$(cat "$STATUS_FILE")" = "false" ]; then
        enable_touchpad
    fi
fi   
