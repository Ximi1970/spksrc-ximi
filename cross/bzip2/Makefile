PKG_NAME = bzip2
PKG_VERS = 1.0.6
PKG_EXT = tar.gz
PKG_DIST_NAME = $(PKG_NAME)-$(PKG_VERS).$(PKG_EXT)
PKG_DIST_SITE = http://bzip.org/$(PKG_VERS)
PKG_DIR = $(PKG_NAME)-$(PKG_VERS)

DEPENDS =

HOMEPAGE = http://bzip.org/
COMMENT  = High-quality data compressor
LICENSE  = BSD License

ifneq ($(findstring bromolow,$(ARCH))$(findstring cedarview,$(ARCH))$(findstring pineview,$(ARCH))$(findstring x86,$(ARCH)),)
LIBDIR=lib64
else
LIBDIR=lib
endif

CONFIGURE_TARGET = nop
COMPILE_TARGET = myCompile
INSTALL_TARGET = myInstall

ADDITIONAL_CFLAGS = -fpic -fPIC -O2 -D_FILE_OFFSET_BITS=64

include ../../mk/spksrc.cross-cc.mk

.PHONY: myCompile
myCompile:
	$(RUN) $(MAKE) bzip2 bzip2recover PREFIX=$(INSTALL_DIR)$(INSTALL_PREFIX) LIBDIR=$(LIBDIR)
	$(RUN) $(MAKE) -f Makefile-libbz2_so PREFIX=$(INSTALL_DIR)$(INSTALL_PREFIX)

.PHONY: myInstall
myInstall:
	@$(RUN) $(MAKE) PREFIX=$(INSTALL_DIR)$(INSTALL_PREFIX) LIBDIR=$(LIBDIR) install
	ln -sf bzip2 $(STAGING_INSTALL_PREFIX)/bin/bunzip2
	ln -sf bzip2 $(STAGING_INSTALL_PREFIX)/bin/bzcat
	ln -sf bzdiff $(STAGING_INSTALL_PREFIX)/bin/bzcmp
	ln -sf bzgrep $(STAGING_INSTALL_PREFIX)/bin/bzegrep
	ln -sf bzgrep $(STAGING_INSTALL_PREFIX)/bin/bzfgrep
	ln -sf bzmore $(STAGING_INSTALL_PREFIX)/bin/bzless
	@$(RUN) cp libbz2.so.1.0.6 $(INSTALL_DIR)$(INSTALL_PREFIX)/$(LIBDIR)/
	ln -sf libbz2.so.1.0.6 $(INSTALL_DIR)$(INSTALL_PREFIX)/$(LIBDIR)/libbz2.so.1.0
