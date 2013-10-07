#!/bin/sh

# Package
PACKAGE="python27-virtualenv"
DNAME="Python Virtualenv"

# Others
INSTALL_DIR="/usr/local/${PACKAGE}"
PATH="${INSTALL_DIR}/bin:/usr/local/bin:/bin:/usr/bin:/usr/syno/bin"

preinst ()
{
    exit 0
}

postinst ()
{
    # Link
    ln -s ${SYNOPKG_PKGDEST} ${INSTALL_DIR}

    ln -s ${INSTALL_DIR}/bin/easy_install /usr/local/python/bin/easy_install
    ln -s ${INSTALL_DIR}/bin/easy_install-2.7 /usr/local/python/bin/easy_install-2.7
    ln -s ${INSTALL_DIR}/bin/pip /usr/local/python/bin/pip
    ln -s ${INSTALL_DIR}/bin/virtualenv /usr/local/python/bin/virtualenv
    
    exit 0
}

preuninst ()
{
    exit 0
}

postuninst ()
{
    # Remove link
    rm -f /usr/local/python/bin/easy_install
    rm -f /usr/local/python/bin/easy_install-2.7
    rm -f /usr/local/python/bin/pip
    rm -f /usr/local/python/bin/virtualenv
    
    rm -f ${INSTALL_DIR}

    exit 0
}

preupgrade ()
{
    exit 0
}

postupgrade ()
{
    exit 0
}
