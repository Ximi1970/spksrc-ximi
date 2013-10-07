PKG_NAME = distribute
PKG_VERS = 0.6.45
PKG_EXT = tar.gz
PKG_DIST_NAME = $(PKG_NAME)-$(PKG_VERS).$(PKG_EXT)
PKG_DIST_SITE = http://pypi.python.org/packages/source/d/$(PKG_NAME)
PKG_DIR = $(PKG_NAME)-$(PKG_VERS)

DEPENDS =

HOMEPAGE = http://pypi.python.org/pypi/distribute
COMMENT  = Easily download, build, install, upgrade, and uninstall Python packages
LICENSE  =

INSTALL_TARGET = myInstall

include ../../mk/spksrc.python-module.mk

.PHONY: myInstall
myInstall:
	$(RUN) mkdir -p $(INSTALL_DIR)$(INSTALL_PREFIX)/$(PYTHON_LIB_DIR)/site-packages
	$(RUN) PYTHONPATH=$(INSTALL_DIR)$(INSTALL_PREFIX)/$(PYTHON_LIB_DIR)/site-packages $(HOSTPYTHON) setup.py install --home=$(INSTALL_DIR)$(INSTALL_PREFIX) --install-purelib=$(INSTALL_DIR)$(INSTALL_PREFIX)/$(PYTHON_LIB_DIR)/site-packages
	$(RUN) cp -f $(WORK_DIR)/../../../cross/$(PKG_NAME)/PLIST.template $(WORK_DIR)/../../../cross/$(PKG_NAME)/PLIST
	$(RUN) sed -i -e 's%@PYTHON_SITE_PACKAGES@%$(PYTHON_LIB_DIR)/site-packages%' -e 's%@PYTHON_VERSION@%$(PYTHON_VERSION)%' $(WORK_DIR)/../../../cross/$(PKG_NAME)/PLIST
