#!/bin/bash

# Paths to battery capacity files
battery0_capacity="/sys/class/power_supply/BAT0/capacity"
battery1_capacity="/sys/class/power_supply/BAT1/capacity"

# Check if the capacity files exist
if [[ -f "$battery0_capacity" && -f "$battery1_capacity" ]]; then
    # Read the battery percentages
    battery0_charge=$(cat "$battery0_capacity")
    battery1_charge=$(cat "$battery1_capacity")

    # Calculate the average charge
    average_charge=$(( (battery0_charge + battery1_charge) / 2 ))

    # Print the average percentage
    echo "$average_charge%"
else
    # If one of the files is missing, print an error
    echo "Error: one or more battery capacity files not found."
fi
