PKG_NAME = zlib
PKG_VERS = 1.2.8
PKG_EXT = tar.gz
PKG_DIST_NAME = $(PKG_NAME)-$(PKG_VERS).$(PKG_EXT)
PKG_DIST_SITE = http://zlib.net
PKG_DIR = $(PKG_NAME)-$(PKG_VERS)

DEPENDS =

HOMEPAGE = http://zlib.net/
COMMENT  = Compression Library
LICENSE  = zlib-license

CONFIGURE_ARGS = --shared --prefix=$(INSTALL_PREFIX)
ifneq ($(findstring bromolow,$(ARCH))$(findstring cedarview,$(ARCH))$(findstring pineview,$(ARCH))$(findstring x86,$(ARCH)),)
CONFIGURE_ARGS += --libdir=$(INSTALL_PREFIX)/lib64
endif

INSTALL_TARGET = myInstall

include ../../mk/spksrc.cross-cc.mk

.PHONY: myInstall
myInstall:
	$(RUN) make install DESTDIR=$(INSTALL_DIR)
