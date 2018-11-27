#!/bin/bash

dconf dump / > roles/desktop/gnome/files/dconf.ini

ignored_keys="
org/gtk/settings/file-chooser
org/gnome/gedit/state/window
org/gnome/nautilus/window-state
org/gnome/software
org/gnome/login-screen
org/gnome/control-center
org/gnome/desktop/background
org/gnome/desktop/screensaver
org/gnome/Weather/Application
"

IFS=$'\n'

for key in $ignored_keys
do
    eval "crudini --inplace --del roles/desktop/gnome/files/dconf.ini $key"
done

perl -i -p0e 's/\n{3,}/\n\n/g' roles/desktop/gnome/files/dconf.ini
