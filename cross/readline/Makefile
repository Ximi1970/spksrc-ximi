PKG_NAME = readline
PKG_VERS = 6.2
PKG_EXT = tar.gz
PKG_DIST_NAME = $(PKG_NAME)-$(PKG_VERS).$(PKG_EXT)
PKG_DIST_SITE = ftp://ftp.gnu.org/gnu/$(PKG_NAME)
PKG_DIR = $(PKG_NAME)-$(PKG_VERS)

DEPENDS = cross/ncurses

HOMEPAGE = http://www.gnu.org/s/readline
COMMENT  = Set of functions for use by applications that allow users to edit command lines as they are typed in.
LICENSE  = http://www.gnu.org/licenses/gpl.html

GNU_CONFIGURE = 1

#INSTALL_TARGET = myInstall

include ../../mk/spksrc.cross-cc.mk

#.PHONY: myInstall
#myInstall:
#	$(RUN) make install DESTDIR=$(INSTALL_DIR)

