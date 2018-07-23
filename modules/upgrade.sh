#!/usr/bin/env bash

case ${OS_NAME} in
    "${OS_FEDORA}")
        if [ ${OS_VERSION} -lt 27 ]; then
            readonly UPGRADE_VERSION=27

            sudo ${PACKAGE_MANAGER} -y --refresh update
            sudo ${PACKAGE_MANAGER} -y install dnf-plugin-system-upgrade
            sudo ${PACKAGE_MANAGER} -y system-upgrade download --releasever=${UPGRADE_VERSION}
            sudo ${PACKAGE_MANAGER} system-upgrade reboot
        fi
     ;;
     *)
        sudo ${PACKAGE_MANAGER} -y --refresh update
     ;;
esac
