#!/usr/bin/env bash

export OS_FEDORA="FEDORA"
export OS_AMAZON_LINUX="AMAZON_LINUX"

if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS_NAME=${NAME}
    export OS_VERSION=${VERSION_ID}
elif type lsb_release >/dev/null 2>&1; then
    OS_NAME=$(lsb_release -si)
    export OS_VERSION=$(lsb_release -sr)
fi

if [ -z "${OS_NAME}"  -o -z "${OS_VERSION}" ]; then
    echo "OS_NAME or OS_VERSION could not be determined, exiting"
    exit 1
fi

PACKAGE_MANAGER=''
case "${OS_NAME}" in
    "Amazon Linux")
        export OS_NAME=${OS_AMAZON_LINUX}
        export PACKAGE_MANAGER=yum
    ;;
    "Fedora")
        export OS_NAME=${OS_FEDORA}
        export PACKAGE_MANAGER=dnf
    ;;
esac

if [ -z "${PACKAGE_MANAGER}" ]; then
    echo "OS not supported, exiting"
    exit 1
fi

echo "os: ${OS_NAME}, version: ${OS_VERSION}"

./modules/upgrade.sh

sudo ${PACKAGE_MANAGER} -y group install "Development Tools" "C Development Tools and Libraries"
sudo ${PACKAGE_MANAGER} -y install ruby-devel rubygem-rake wget make openssl-devel git vim maven python-devel \
 python-pip zlib-devel readline-devel sqlite-devel bzip2-devel python-devel mlocate zopfli pigz htop iftop iotop \
 bash-completion gvim jq tree docker iptraf libtool-devel automake autoconf m4 systemtap-sdt-devel libffi-devel pcre-devel

sudo updatedb