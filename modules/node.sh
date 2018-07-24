#!/usr/bin/env bash

readonly NODE_VERSION='8.11.3'

wget --no-cookies --no-check-certificate --directory-prefix=/tmp https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}.tar.gz
sudo tar -xvf /tmp/node-v${NODE_VERSION}.tar.gz -C /opt
cd /opt/node-v${NODE_VERSION}
sudo ./configure
sudo make -j4 && sudo make install -j4
cd -

sudo ln -s /usr/local/bin/node /usr/bin/node
sudo ln -s /usr/local/lib/node /usr/lib/node
sudo ln -s /usr/local/bin/npm /usr/bin/npm

export PATH=/usr/local/bin:$PATH

tee -a ~/.bash_profile << END

# node
export PATH=/usr/local/bin:\$PATH
END

# basics
chown -R $(whoami) $(npm config get prefix)/{lib/node_modules,bin,share}

npm install node-gyp node-pre-gyp -g
npm install pm2 -g