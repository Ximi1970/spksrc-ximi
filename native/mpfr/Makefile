PKG_NAME = mpfr
PKG_VERS = 3.1.2
PKG_EXT = tar.bz2
PKG_DIST_NAME = $(PKG_NAME)-$(PKG_VERS).$(PKG_EXT)
PKG_DIST_SITE = http://www.mpfr.org/mpfr-$(PKG_VERS)
PKG_DIR = $(PKG_NAME)-$(PKG_VERS)

DEPENDS = native/gmp

HOMEPAGE = http://www.mpfr.org
COMMENT  = Multiple-precision floating-point computations with correct rounding
LICENSE  = LGPL

HOST_ARCH = $(shell getconf LONG_BIT)
ifeq ($(HOST_ARCH),64)
LIBDIR=lib64
else
LIBDIR=lib
endif


INSTALL_TARGET = myInstall


GNU_CONFIGURE = 1

CONFIGURE_ARGS += --with-gmp-include=$(WORK_DIR)/../../gmp/work-native/install/usr/local/include
CONFIGURE_ARGS += --with-gmp-lib=$(WORK_DIR)/../../gmp/work-native/install/usr/local/$(LIBDIR)


include ../../mk/spksrc.native-cc.mk


.PHONY: myInstall
myInstall:
	$(RUN) $(MAKE) install prefix=$(STAGING_INSTALL_PREFIX)
	$(RUN) rm $(STAGING_INSTALL_PREFIX)/$(LIBDIR)/*.la
