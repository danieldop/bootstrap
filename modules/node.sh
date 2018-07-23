#!/usr/bin/env bash

readonly NODE_VERSION='8.11.3'

wget --no-cookies --no-check-certificate --directory-prefix=/tmp https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh
sh /tmp/install.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm install ${NODE_VERSION}
nvm use ${NODE_VERSION}

tee -a ~/.bash_profile << END

# node
export NVM_DIR="\$HOME/.nvm"
[ -s "\$NVM_DIR/nvm.sh" ] && \. "\$NVM_DIR/nvm.sh"
[ -s "\$NVM_DIR/bash_completion" ] && \. "\$NVM_DIR/bash_completion"
END

npm install -g pm2
