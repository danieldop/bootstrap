#!/usr/bin/env bash

export OS_FEDORA="FEDORA"
export OS_AMAZON_LINUX="OS_AMAZON_LINUX"

if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS_NAME=${NAME}
    OS_VERSION=${VERSION_ID}
elif type lsb_release >/dev/null 2>&1; then
    OS_NAME=$(lsb_release -si)
    OS_VERSION=$(lsb_release -sr)
fi

if [ -z "${OS_NAME}"  -o -z "${OS_VERSION}" ]; then
    echo "OS_NAME or OS_VERSION could not be determined, exiting"
    exit 1
fi

PACKAGE_MANAGER=''
case "${OS_NAME}" in
    "Amazon Linux")
        OS_NAME=${OS_AMAZON_LINUX}
        PACKAGE_MANAGER=yum
    ;;
    "Fedora")
        OS_NAME=${OS_FEDORA}
        PACKAGE_MANAGER=dnf
    ;;
esac

if [ -z "${PACKAGE_MANAGER}" ]; then
    echo "OS not supported, exiting"
    exit 1
fi

echo "os: ${OS_NAME}, version: ${OS_VERSION}"

sudo ${PACKAGE_MANAGER} -y group install "Development Tools" "C Development Tools and Libraries"
sudo ${PACKAGE_MANAGER} -y install google-chrome-stable ruby-devel rubygem-rake wget make openssl-devel git \
 zlib-devel readline-devel sqlite-devel bzip2-devel python-devel mlocate zopfli pigz htop iftop iotop \
 bash-completion gvim jq tree docker iptraf libtool automake autoconf m4 systemtap-sdt-devel libffi-devel

 updatedb

# snap
sudo ${PACKAGE_MANAGER} -y install snapd
sudo ln -s /var/lib/snapd/snap /snap

sudo snap install telegram-desktop vlc atom spotify postman
sudo snap install --classic slack
sudo snap install --classic atom

# modules
#./modules/java.sh
#./modules/node.sh
#./modules/openresty.sh
#./modules/lua.sh
#./modules/misc.sh
