#!/usr/bin/env bash

# repos
sudo dnf -y install fedora-workstation-repositories
sudo dnf config-manager --set-enabled google-chrome

# install
sudo dnf -y install google-chrome-stable terminator gnome-tweak-tool dconf-editor

# snap
sudo dnf -y install snapd
sudo ln -s /var/lib/snapd/snap /snap

sudo snap install telegram-desktop vlc spotify postman
sudo snap install --classic slack
sudo snap install --classic atom
