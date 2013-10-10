SPK_NAME = python27-virtualenv
SPK_VERS = 1.9.1
SPK_REV = 1
SPK_ICON = src/python.png
DSM_UI_DIR = app

PYTHON_DEPENDS = cross/python27 cross/distribute cross/pip
DEPENDS = cross/virtualenv

MAINTAINER = Ximi1970
DESCRIPTION = Python Virtualenv package.
DESCRIPTION_FRE = Python Virtualenv package.
RELOAD_UI = yes
DISPLAY_NAME = Python 2.7 Virtualenv

HOMEPAGE   = https://github.com/Ximi1970/spksrc
LICENSE    = GNU GPL

INSTALLER_SCRIPT = src/installer.sh
SSS_SCRIPT       = src/dsm-control.sh
ADDITIONAL_SCRIPTS =

PYTHON_INSTALL_PREFIX = /usr/local/python27
INSTALL_PREFIX = /usr/local/$(SPK_NAME)

ifneq ($(ARCH),)
include work-$(ARCH)/python-cc.mk
PLIST_TRANSFORM = sed -e 's%@PYTHON_SITE_PACKAGES@%$(PYTHON_LIB_DIR)/site-packages%' -e 's%@PYTHON_VERSION@%$(PYTHON_VERSION)%'
endif

include ../../mk/spksrc.spk.mk
