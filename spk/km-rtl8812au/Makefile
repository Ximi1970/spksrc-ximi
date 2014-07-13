SPK_NAME = km-rtl8812au
SPK_VERS = 1.0
SPK_REV = 1
SPK_ICON = src/tux-icon.png
DSM_UI_DIR = app
BETA = 1
BETA_REPORT_URL = "https://github.com/Ximi1970/spksrc-ximi/issues"

DEPENDS = cross/km-rtl8812au

MAINTAINER = Ximi1970
DESCRIPTION = rtl8812AU linux kernel driver for AC1200 801.11ac Wireless Dual-Band USB Adapter.
DESCRIPTION_FRE = rtl8812AU linux kernel driver for AC1200 801.11ac Wireless Dual-Band USB Adapter.
RELOAD_UI = yes
DISPLAY_NAME = 8812au Kernel Module

HOMEPAGE   = https://github.com/abperiasamy/rtl8812AU_8821AU_linux
LICENSE    = GPLv2

INSTALLER_SCRIPT = src/installer.sh
SSS_SCRIPT       = src/dsm-control.sh
ADDITIONAL_SCRIPTS =

INSTALL_PREFIX = /usr/local/$(SPK_NAME)

POST_STRIP_TARGET = extra_install


include ../../mk/spksrc.spk.mk



.PHONY: extra_install
extra_install:
	install -m 755 -d $(STAGING_DIR)/system
	install -m 644 src/usb.wireless.table $(STAGING_DIR)/system
