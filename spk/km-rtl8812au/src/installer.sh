#!/bin/sh

# Package
PACKAGE="km-rtl8812au"

# Others
INSTALL_DIR="/usr/local/${PACKAGE}"

preinst ()
{
    exit 0
}

postinst ()
{
    #
    # Link package
    #
    ln -s ${SYNOPKG_PKGDEST} ${INSTALL_DIR}

    #
    # Install modules
    #
    ln -sf ${INSTALL_DIR}/modules/8812au.ko /lib/modules/8812au.ko
    
    #
    # Backup hotplug
    #
    mkdir -p ${INSTALL_DIR}/backup
    cp -f /usr/syno/hotplug/usb.wireless.function ${INSTALL_DIR}/backup
    cp -f /usr/syno/hotplug/usb.wireless.table ${INSTALL_DIR}/backup
    
    #
    # Patch hotplug
    #
    cat ${INSTALL_DIR}/system/usb.wireless.table >> /usr/syno/hotplug/usb.wireless.table

    sed -i 's/\(^ATH_MODULES.*\)/RTL8812AU_MODULES="\$\{WIRELESS_MODULE\} 8812au"\n\1/' /usr/syno/hotplug/usb.wireless.function
    sed -i 's/\(^\tcase "$modules" in\)/\1\n\t\t8812au)\t\t\t\t\t##RTL8812AU\n\t\t\tmodules="${RTL8812AU_MODULES}"\t##RTL8812AU\n\t\t\t;;\t\t\t\t##RTL8812AU/' /usr/syno/hotplug/usb.wireless.function
    
    exit 0
}

preuninst ()
{
    exit 0
}

postuninst ()
{
    #
    # Unpatch hotplug
    #
    sed -i "/8812au/d" /usr/syno/hotplug/usb.wireless.table
    sed -i "/RTL8812AU/d" /usr/syno/hotplug/usb.wireless.function

    #
    # Remove modules
    #
    rm -f /lib/modules/8812au.ko
    
    #
    # Remove package
    #
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
