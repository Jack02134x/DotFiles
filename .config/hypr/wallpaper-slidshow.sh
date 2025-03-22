#!/bin/bash

# Set wallpaper directory
wallpaper_dir="$HOME/.config/hypr/wallpapers" # Change this to your wallpaper folder

# Check if swww is running, start it if not
if ! pgrep -x "swww" > /dev/null; then
    swww init
fi

# Main loop
while true; do
    # Get list of wallpapers
    wallpapers=($(ls "$wallpaper_dir"))
    
    # Select a random wallpaper
    chosen_wallpaper=${wallpapers[$RANDOM % ${#wallpapers[@]}]}
    wallpaper_path="$wallpaper_dir/$chosen_wallpaper"
    
    # Set the wallpaper
    swww img "$wallpaper_path"
    
    # Wait
    sleep 180
done