#!/usr/bin/env bash

readonly LUAROCKS_VERSION=2.0.13
readonly LUAROCKS_CONFIG_FLAGS="--prefix=/usr/local/openresty/luajit --with-lua=/usr/local/openresty/luajit/ --lua-suffix=jit --with-lua-include=/usr/local/openresty/luajit/include/luajit-2.1"

wget --directory-prefix=/tmp http://luarocks.org/releases/luarocks-${LUAROCKS_VERSION}.tar.gz
sudo tar -xzvf /tmp/luarocks-${LUAROCKS_VERSION}.tar.gz -C /opt
cd /opt/luarocks-${LUAROCKS_VERSION}
sudo ./configure ${LUAROCKS_CONFIG_FLAGS}
sudo make -j4 && sudo make install -j4
cd -

## gumbo-parser
sudo git clone git://github.com/google/gumbo-parser.git /opt/gumbo-parser/
cd /opt/gumbo-parser/
sudo ./autogen.sh
sudo ./configure
sudo make -j4 && sudo make install -j4
cd -

sudo /usr/bin/mkdir -p '/usr/local/include'
sudo /usr/bin/install -c -m 644 /opt/gumbo-parser/src/gumbo.h /opt/gumbo-parser/src/tag_enum.h '/usr/local/include'
sudo /usr/bin/mkdir -p '/usr/local/lib/pkgconfig'
sudo /usr/bin/install -c -m 644 /opt/gumbo-parser/gumbo.pc '/usr/local/lib/pkgconfig'
sudo ln -s /usr/local/lib/libgumbo*  /usr/local/openresty/luajit/lib/

## rocks
sudo /usr/local/openresty/luajit/bin/luarocks install cx-gumbo