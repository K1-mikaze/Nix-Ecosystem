#!/usr/bin/env bash

# Define the options
options="  Save  \n  Full  "

# Use rofi to select an option
chosen_option=$(echo -e "$options" | rofi -dmenu -i -p "  Select battery mode:  ")

if [ "$chosen_option" = "" ]; then
    exit
elif [ "$chosen_option" = "  Save  " ]; then
    password=$(rofi -dmenu -password -p "Password: ")
    echo "$password" | sudo -S save-bat
elif [ "$chosen_option" = "  Full  " ]; then
    password=$(rofi -dmenu -password -p "Password: ")
    echo "$password" | sudo -S full-bat
fi
