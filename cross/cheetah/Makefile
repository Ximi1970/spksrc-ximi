PKG_NAME = Cheetah
PKG_VERS = 2.4.4
PKG_EXT = tar.gz
PKG_DIST_NAME = $(PKG_NAME)-$(PKG_VERS).$(PKG_EXT)
PKG_DIST_SITE = http://pypi.python.org/packages/source/C/$(PKG_NAME)
PKG_DIR = $(PKG_NAME)-$(PKG_VERS)

DEPENDS =

HOMEPAGE = http://www.cheetahtemplate.org/
COMMENT  = Cheetah is a template engine and code generation tool.
LICENSE  = MIT License

INSTALL_ARGS = --install-purelib=$(INSTALL_PREFIX)/$(PYTHON_LIB_DIR)/site-packages

include ../../mk/spksrc.python-module.mk
