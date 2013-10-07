PKG_NAME = pip
PKG_VERS = 1.3.1
PKG_EXT = tar.gz
PKG_DIST_NAME = $(PKG_NAME)-$(PKG_VERS).$(PKG_EXT)
PKG_DIST_SITE = http://pypi.python.org/packages/source/p/$(PKG_NAME)
PKG_DIR = $(PKG_NAME)-$(PKG_VERS)

DEPENDS =

HOMEPAGE = http://pypi.python.org/pypi/pip
COMMENT  = pip installs packages. Python packages.
LICENSE  =

INSTALL_TARGET = myInstall

include ../../mk/spksrc.python-module.mk

.PHONY: myInstall
myInstall:
	$(RUN) mkdir -p $(INSTALL_DIR)$(INSTALL_PREFIX)/$(PYTHON_LIB_DIR)/site-packages
	$(RUN) PYTHONPATH=$(INSTALL_DIR)$(INSTALL_PREFIX)/$(PYTHON_LIB_DIR)/site-packages $(HOSTPYTHON) setup.py install --home=$(INSTALL_DIR)$(INSTALL_PREFIX) --install-purelib=$(INSTALL_DIR)$(INSTALL_PREFIX)/$(PYTHON_LIB_DIR)/site-packages
