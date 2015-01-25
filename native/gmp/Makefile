PKG_NAME = gmp
PKG_VERS = 6.0.0
PKG_EXT = tar.bz2
PKG_DIST_NAME = $(PKG_NAME)-$(PKG_VERS)a.$(PKG_EXT)
PKG_DIST_SITE = https://gmplib.org/download/gmp

PKG_DIR = $(PKG_NAME)-$(PKG_VERS)

DEPENDS =

HOMEPAGE = http://gmplib.org/
COMMENT  = The GNU Multiple Precision Arithmetic Library
LICENSE  = LGPL

HOST_ARCH = $(shell getconf LONG_BIT)
ifeq ($(HOST_ARCH),64)
ARCH_ABI=64
LIBDIR=lib64
else
ARCH_ABI=32
LIBDIR=lib
endif


COMPILE_TARGET = myCompile
INSTALL_TARGET = myInstall


GNU_CONFIGURE = 1
CONFIGURE_ARGS = ABI=$(ARCH_ABI)


include ../../mk/spksrc.native-cc.mk

.PHONY: myCompile
myCompile:
	$(RUN) $(MAKE) $(MAKE_OPT)

.PHONY: myInstall
myInstall:
	$(RUN) $(MAKE) install prefix=$(STAGING_INSTALL_PREFIX)
	$(RUN) rm $(STAGING_INSTALL_PREFIX)/$(LIBDIR)/*.la

