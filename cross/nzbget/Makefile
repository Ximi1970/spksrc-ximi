PKG_NAME = nzbget
PKG_VERS = 11.0
PKG_EXT = tar.gz
PKG_DIST_NAME = $(PKG_NAME)-$(PKG_VERS).$(PKG_EXT)
PKG_DIST_SITE = http://sourceforge.net/projects/nzbget/files
PKG_DIR = $(PKG_NAME)-$(PKG_VERS)

DEPENDS = cross/libxml2 cross/ncurses cross/libsigc++ cross/libpar2 cross/openssl

HOMEPAGE = http://nzbget.sourceforge.net/
COMMENT  = NZBGet is a command-line based binary newsgrabber for nzb files, written in C++. It supports client/server mode, automatic par-check/-repair and web-interface. NZBGet requires low system resources.
LICENSE  = 

PRE_CONFIGURE_TARGET = myPreConfigure
INSTALL_TARGET = myInstall

GNU_CONFIGURE = 1
CONFIGURE_ARGS = --exec-prefix=$(INSTALL_PREFIX) LIBPREF=$(INSTALL_PREFIX)

include ../../mk/spksrc.cross-cc.mk

.PHONY: myPreConfigure
myPreConfigure:
	$(RUN) touch configure
	$(RUN) touch Makefile.in

.PHONY: myInstall
myInstall:
	$(RUN) make install DESTDIR=$(INSTALL_DIR)
