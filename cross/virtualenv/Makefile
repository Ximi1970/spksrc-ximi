PKG_NAME = virtualenv
PKG_VERS = 1.9.1
PKG_EXT = tar.gz
PKG_DIST_NAME = $(PKG_NAME)-$(PKG_VERS).$(PKG_EXT)
PKG_DIST_SITE = http://pypi.python.org/packages/source/v/$(PKG_NAME)
PKG_DIR = $(PKG_NAME)-$(PKG_VERS)

DEPENDS =

HOMEPAGE = http://pypi.python.org/pypi/virtualenv
COMMENT  = Virtual Python Environment builder
LICENSE  = MIT-style permissive license

INSTALL_ARGS = --install-purelib=$(INSTALL_PREFIX)/$(PYTHON_LIB_DIR)/site-packages

include ../../mk/spksrc.python-module.mk
