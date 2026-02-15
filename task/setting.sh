#!/bin/bash

# Enable firewall. 
sudo ufw enable
sudo ufw default deny

# Translate name of directory in home to japanese. 
LANG=C xdg-user-dirs-gtk-update

# Optimize power consumption. 
sudo apt -y install powertop
sudo powertop –auto-tune

# Set for display. 
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-timeout 1800
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-timeout 1200
gsettings set org.gnome.desktop.session idle-delay 900
gsettings set org.gnome.desktop.interface show-battery-percentage true
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.desktop.interface clock-show-seconds true

# Set for desktop. 
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.tiling-assistant enable-tiling-popup false

# Set for touchpad. 
gsettings set org.gnome.desktop.peripherals.touchpad speed 0.4
gsettings set org.gnome.desktop.interface locate-pointer true

# Git.
git config --global init.defaultBranch main
git config --global core.editor vim
