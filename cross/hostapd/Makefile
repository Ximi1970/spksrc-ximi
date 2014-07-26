PKG_NAME = hostapd
PKG_VERS = 2.2
PKG_EXT = tar.gz
PKG_DIR = $(PKG_NAME)-$(PKG_VERS)
PKG_DIST_NAME = $(PKG_NAME)-$(PKG_VERS).$(PKG_EXT)
PKG_DIST_SITE = http://w1.fi/releases/

DEPENDS = cross/openssl cross/libnl

HOMEPAGE = http://w1.fi/hostapd/
COMMENT  = User space daemon for access point and authentication servers.
LICENSE  = BSD/GPL v2

CONFIGURE_TARGET = myConfigure
COMPILE_TARGET = myCompile
INSTALL_TARGET = myInstall


include ../../mk/spksrc.cross-cc.mk


.PHONY: myConfigure
myConfigure:
	$(RUN) echo ; cd hostapd ; cp -f defconfig .config

.PHONY: myCompile
myCompile:
	$(RUN) echo ; cd hostapd ; $(MAKE) $(MAKE_OPT)

.PHONY: myInstall
myInstall:
	$(RUN) echo ; cd hostapd ; $(MAKE) $(MAKE_OPT) install DESTDIR=$(INSTALL_DIR)
