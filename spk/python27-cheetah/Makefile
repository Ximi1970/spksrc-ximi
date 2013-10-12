SPK_NAME = python27-cheetah
SPK_VERS = 2.4.4
SPK_REV = 1
SPK_ICON = src/python.png
DSM_UI_DIR = app

PYTHON_DEPENDS = cross/python27 cross/distribute cross/pip
DEPENDS = cross/cheetah
SPK_DEPENDS = "python27>2.7.5-1"

MAINTAINER = Ximi1970
DESCRIPTION = Python Cheetah package.
DESCRIPTION_FRE = Python Cheetah package.
RELOAD_UI = yes
DISPLAY_NAME = Python 2.7 Cheeta

HOMEPAGE   = https://github.com/Ximi1970/spksrc
LICENSE    = GNU GPL

INSTALLER_SCRIPT = src/installer.sh
SSS_SCRIPT       = src/dsm-control.sh
ADDITIONAL_SCRIPTS =

PYTHON_INSTALL_PREFIX = /usr/local/python27
INSTALL_PREFIX = /usr/local/$(SPK_NAME)

PLIST_TRANSFORM = sed -e 's%@PYTHON_SITE_PACKAGES@%$(PYTHON_LIB_DIR)/site-packages%' -e 's%@PYTHON_VERSION@%$(PYTHON_VERSION)%'

PRE_COPY_TARGET = myPreCopy

include ../../mk/spksrc.spk.mk

.PHONY: myPreCopy
myPreCopy:
	$(eval PYTHON_VERSION := $(shell cat $(WORK_DIR)/python-cc.mk | grep PYTHON_VERSION | sed -e 's/.*=//'))
	$(eval PYTHON_LIB_DIR := $(shell cat $(WORK_DIR)/python-cc.mk | grep PYTHON_LIB_DIR | sed -e 's/.*=//'))
