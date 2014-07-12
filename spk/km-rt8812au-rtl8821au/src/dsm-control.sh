#!/bin/sh

# Package
PACKAGE="km-rtl8812au-rtl8821au"
DNAME="rt8812au/rtl8821au Kernel Module"

# Others
INSTALL_DIR="/usr/local/${PACKAGE}"


case $1 in
    start)
        exit 0
    ;;
    stop)
        exit 0
    ;;
    status)
        exit 1
    ;;
    log)
        echo "${INSTALL_DIR}/install.log"
        exit 0
    ;;
esac
