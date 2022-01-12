#!/bin/bash

BASE="$(dirname $0)"

dconf_ini=$BASE/../roles/desktop/gnome-shell/files/dconf.ini

dconf dump / > $dconf_ini

echo '[end]' >> $dconf_ini

ignored_key_prefixes="
apps/seahorse
ca/desrt/dconf-editor
org/gnome/baobab
org/gnome/boxes
org/gnome/calculator
org/gnome/calendar
org/gnome/Characters
org/gnome/cheese
org/gnome/clocks
org/gnome/control-center
org/gnome/desktop/a11y/magnifier
org/gnome/desktop/app-folders
org/gnome/desktop/background
org/gnome/desktop/notifications
org/gnome/desktop/screensaver
org/gnome/desktop/search-providers
org/gnome/eog
org/gnome/evince
org/gnome/evolution
org/gnome/file-roller
org/gnome/gedit
org/gnome/gnome-screenshot
org/gnome/gnome-system-monitor
org/gnome/GWeather
org/gnome/login-screen
org/gnome/meld
org/gnome/nautilus/window-state
org/gnome/nm-applet
org/gnome/rhythmbox
org/gnome/shell/weather
org/gnome/shell/world-clocks
org/gnome/simple-scan
org/gnome/software
org/gnome/Totem
org/gnome/Weather
org/gtk/settings/color-chooser
org/gtk/settings/file-chooser
org/virt-manager/virt-manager
"

ignored_keys=""

IFS=$'\n'

for key in $ignored_key_prefixes; do
    matching=$(grep -E "^\[$key" "$dconf_ini")
    if [ -z "$matching" ]; then
        continue
    fi
    ignored_keys="${ignored_keys}${matching}"
done

ignored_keys=$(echo "$ignored_keys" | sed -E 's/[[:space:]]//g' | sed -E 's/\[//g' | sed -E 's/\]/\n/g')


for key in $ignored_keys; do
    start=$(grep -n "\[$key" "$dconf_ini" | cut -f1 -d: | head -1 | tr -d '\n')
    if [ -z "$start" ]; then
        continue
    fi

    lines=$(tail -n "+$start" "$dconf_ini" | grep -En "^\["  | cut -f1 -d: | head -2 | tail -1 | tr -d '\n')
    if [ -z "$lines" ]; then
        continue
    fi
    end=$(($start + $lines - 2))

    sed -i "${start},${end}d" "$dconf_ini"
done

sed -i '$d' "$dconf_ini"
perl -i -p0e 's/\n{2,}/\n\n/g' $dconf_ini
