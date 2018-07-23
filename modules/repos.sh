#!/usr/bin/env bash

# fedora
sudo dnf -y install fedora-workstation-repositories
sudo dnf config-manager --set-enabled google-chrome

# openresty
sudo tee -a /etc/yum.repos.d/openresty.repo << END
[openresty-openresty]
name=Copr repo for openresty owned by openresty
baseurl=https://copr-be.cloud.fedoraproject.org/results/openresty/openresty/fedora-$releasever-$basearch/
type=rpm-md
skip_if_unavailable=True
gpgcheck=1
gpgkey=https://copr-be.cloud.fedoraproject.org/results/openresty/openresty/pubkey.gpg
repo_gpgcheck=0
enabled=1
enabled_metadata=1
END
