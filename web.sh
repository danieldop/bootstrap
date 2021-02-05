#!/usr/bin/env bash

# Install tooling needed for Front End developers.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Download and install nvm - Node version manager
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash

# Run nvm
. ~/.nvm/nvm.sh

# Install and use lts Node release
nvm install --lts

echo "\nLatest Node lts released installed."

echo "
Note!

Please switch to propper Node version when starting working on frontend service.
Currently it is explicitly set in Dockerfile in each service.
.nmvrc files would be added for easy one line version switch in nearest future.
"