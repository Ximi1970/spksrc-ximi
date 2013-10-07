#!/bin/sh

# Package
PACKAGE="python-virtualenv"
DNAME="Python Virtualenv"

# Others
INSTALL_DIR="/usr/local/${PACKAGE}"
PATH="${INSTALL_DIR}/bin:/usr/local/bin:/bin:/usr/bin:/usr/syno/bin"


case $1 in
    start)
        exit 0
    ;;
    stop)
        exit 0
    ;;
    status)
        exit 0
    ;;
    log)
        echo "${INSTALL_DIR}/install.log"
        exit 0
    ;;
    *)
        exit 1
        ;;  
esac
