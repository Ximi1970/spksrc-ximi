PKG_NAME = libmng
PKG_VERS = 2.0.2
PKG_EXT = tar.gz
PKG_DIST_NAME = $(PKG_NAME)-$(PKG_VERS).$(PKG_EXT)
PKG_DIST_SITE = http://download.sourceforge.net/project/$(PKG_NAME)/$(PKG_NAME)-devel/$(PKG_VERS)
PKG_DIR = $(PKG_NAME)-$(PKG_VERS)

DEPENDS = cross/zlib cross/libjpeg cross/lcms2

HOMEPAGE = http://www.libmng.com/pub/mng/index.html
COMMENT  = Multiple-image Network Graphics Library
LICENSE  = http://www.libmng.com/license.html

ifneq ($(findstring bromolow,$(ARCH))$(findstring cedarview,$(ARCH))$(findstring pineview,$(ARCH))$(findstring x86,$(ARCH)),)
LIBDIR=lib64
else
LIBDIR=lib
endif

CONFIGURE_TARGET = myConfigure
COMPILE_TARGET = myCompile
INSTALL_TARGET = myInstall

ADDITIONAL_CFLAGS = -fPIC

include ../../mk/spksrc.cross-cc.mk

.PHONY: myConfigure
myConfigure:
	$(RUN) bash -c "mkdir -p build ; cd build ; cmake -DCMAKE_LIBRARY_PATH=$(INSTALL_DIR)$(INSTALL_PREFIX)/$(LIBDIR) -DCMAKE_INCLUDE_PATH=$(INSTALL_DIR)$(INSTALL_PREFIX)/include -DWITH_LCMS2:bool=on -DBUILD_MAN:bool=on -DBUILD_SHARED_LIBS:bool=on -DCMAKE_INSTALL_PREFIX:path=$(INSTALL_PREFIX) .."

.PHONY: myCompile
myCompile:
	$(RUN) bash -c "cd build ; make"

.PHONY: myInstall
myInstall:
	$(RUN) bash -c "cd build ; make install DESTDIR=$(INSTALL_DIR)"
