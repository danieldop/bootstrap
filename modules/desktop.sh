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

#echo GRUB_CMDLINE_LINUX="rd.lvm.lv=fedora/root rd.lvm.lv=fedora/swap rhgb quiet nouveau.modeset=0 nouveau.runpm=0" >> /etc/default/grub
#sudo grub2-mkconfig -o /etc/grub2-efi.cfg