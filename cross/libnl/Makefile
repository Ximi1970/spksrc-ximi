PKG_NAME = libnl
PKG_VERS = 3.2.25
PKG_EXT = tar.gz
PKG_DIR = $(PKG_NAME)-$(PKG_VERS)
PKG_DIST_NAME = $(PKG_NAME)-$(PKG_VERS).$(PKG_EXT)
PKG_DIST_SITE = http://www.infradead.org/~tgr/libnl/files

DEPENDS =

HOMEPAGE = http://www.infradead.org/~tgr/libnl
COMMENT  = Collection of libraries providing APIs to netlink protocol based Linux kernel interfaces.
LICENSE  = GPLv2.1

GNU_CONFIGURE = 1

#CONFIGURE_TARGET = myConfigure
#COMPILE_TARGET = myCompile
#INSTALL_TARGET = myInstall


include ../../mk/spksrc.cross-cc.mk


.PHONY: myConfigure
myConfigure:
	$(RUN) echo ; cd hostapd ; cp -f defconfig .config

.PHONY: myCompile
myCompile:
	$(RUN) echo ; cd hostapd ; make

.PHONY: myInstall
myInstall:
	exit 1
	$(RUN) make install DESTDIR=$(INSTALL_DIR)
