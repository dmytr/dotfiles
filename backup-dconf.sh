#!/bin/bash

dconf_ini=roles/desktop/gnome/files/dconf.ini

dconf dump / > $dconf_ini

ignored_keys="
org/gtk/settings/file-chooser
org/gnome/software
org/gnome/login-screen
org/gnome/control-center
org/gnome/desktop/background
org/gnome/desktop/screensaver
org/gnome/gedit/state/window
org/gnome/gedit/plugins/filebrowser
org/gnome/nautilus/window-state
org/gnome/Weather/Application
org/gnome/calculator
org/gnome/evince/default
org/gnome/Totem
`crudini --get $dconf_ini | grep 'org/gnome/file-roller'`
`crudini --get $dconf_ini | grep 'org/gnome/evolution'`
`crudini --get $dconf_ini | grep 'org/gnome/gnome-system-monitor'`
`crudini --get $dconf_ini | grep 'org/gnome/nm-applet/eap'`
"

IFS=$'\n'

for key in $ignored_keys
do
    eval "crudini --inplace --del $dconf_ini $key"
done

perl -i -p0e 's/\n{3,}/\n\n/g' $dconf_ini
