#!/bin/sh

# Package
PACKAGE="python27-cheetah"
DNAME="Python 2.7 Cheetah"

# Others
INSTALL_DIR="/usr/local/${PACKAGE}"
PATH="${INSTALL_DIR}/bin:/usr/local/bin:/bin:/usr/bin:/usr/syno/bin"
PYTHON="/usr/local/python27"

preinst ()
{
    exit 0
}

postinst ()
{
    # Link
    ln -s ${SYNOPKG_PKGDEST} ${INSTALL_DIR}

    ln -s ${INSTALL_DIR}/bin/cheetah ${PYTHON}/bin/cheetah
    ln -s ${INSTALL_DIR}/bin/cheetah-analyze ${PYTHON}/bin/cheetah-analyze
    ln -s ${INSTALL_DIR}/bin/cheetah-compile ${PYTHON}/bin/cheetah-compile

    if [ -d ${INSTALL_DIR}/lib ] ; then
      LIBDIR=lib
    else
      LIBDIR=lib64
    fi

    for i in `ls ${INSTALL_DIR}/${LIBDIR}/python2.7/site-packages` ; do
      ln -s ${INSTALL_DIR}/${LIBDIR}/python2.7/site-packages/$i ${PYTHON}/${LIBDIR}/python2.7/site-packages/$i
    done

    exit 0
}

preuninst ()
{
   if [ -d ${INSTALL_DIR}/lib ] ; then
      LIBDIR=lib
    else
      LIBDIR=lib64
    fi

    for i in `ls ${INSTALL_DIR}/${LIBDIR}/python2.7/site-packages` ; do
      if [ -d $i ] ; then
        rm -rf ${PYTHON}/${LIBDIR}/python2.7/site-packages/$i
      else
        rm -f ${PYTHON}/${LIBDIR}/python2.7/site-packages/$i     
      fi
    done
 
    rm -f ${PYTHON}/bin/cheetah
    rm -f ${PYTHON}/bin/cheetah-analyze
    rm -f ${PYTHON}/bin/cheetah-compile

    exit 0
}

postuninst ()
{
    # Remove link
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
