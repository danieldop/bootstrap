#!/usr/bin/env bash

case ${OS_NAME} in
    ${OS_FEDORA})
        if [ ${OS_VERSION} -lt 27 ]; then
            readonly UPGRADE_VERSION=27
            echo "updating packages & os to version ${UPGRADE_VERSION}"

            sudo ${PACKAGE_MANAGER} -y --refresh update
            sudo ${PACKAGE_MANAGER} -y install dnf-plugin-system-upgrade
            sudo ${PACKAGE_MANAGER} -y system-upgrade download --releasever=${UPGRADE_VERSION}
            sudo ${PACKAGE_MANAGER} system-upgrade reboot
         else
            echo "os already up to date"
        fi
     ;;
     *)
        echo "updating packages"
        sudo ${PACKAGE_MANAGER} -y --refresh update
     ;;
esac
