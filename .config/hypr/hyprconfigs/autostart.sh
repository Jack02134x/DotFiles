#!/usr/bin/bash

# bar/panel
waybar &
#hyprpanel &

# wallpaper
#hyprpaper &
#swww-daemon &
./.config/hypr/wallpaper-slidshow.sh &
#mpvpaper -o "no-audio --loop-playlist shuffle" eDP-1 /home/jack/.config/hypr/wallpapers/'21 - Lone Samurai Sekiro Live Wallpaper.mp4' &

# Applets
nm-applet &

#notifications
swaync &

#applications
telegram-desktop -startintray &
zapzap --start-minimized &
#discord --start-minimized &


# hypridle the automatic lock
hypridle &

# other
wl-paste --watch cliphist store &
#libinput-gestures-setup start &
