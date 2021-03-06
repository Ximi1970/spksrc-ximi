PKG_NAME = qt-everywhere-opensource-src
PKG_VERS = 4.8.6
PKG_EXT = tar.gz
PKG_DIR = $(PKG_NAME)-$(PKG_VERS)
PKG_DIST_NAME = $(PKG_DIR).$(PKG_EXT)
PKG_DIST_SITE = http://download.qt-project.org/official_releases/qt/4.8/$(PKG_VERS)

DEPENDS = cross/glib cross/openssl cross/libpng cross/libmng cross/libjpeg cross/libtiff cross/sqlite cross/libxml2 cross/freetype2

HOMEPAGE = http://qt-project.org
COMMENT  = Qt is a full development framework with tools designed to streamline the creation of applications and user interfaces for desktop, embedded and mobile platforms.
LICENSE  = LGPL

CONFIGURE_TARGET = myConfigure
COMPILE_TARGET = myCompile
INSTALL_TARGET = myInstall

ifneq ($(findstring bromolow,$(ARCH))$(findstring cedarview,$(ARCH))$(findstring pineview,$(ARCH))$(findstring x86,$(ARCH)),)
LIBDIR = lib64
else
LIBDIR = lib
endif

QT_ARCH = qws/linux-g++-syno_$(ARCH)

CONFIGURE_ARGS = -release -opensource -confirm-license -embedded -force-pkg-config -no-rpath
#CONFIGURE_ARGS += -xplatform $(QT_ARCH) -prefix $(INSTALL_PREFIX)/Qt-$(PKG_VERS) -libdir $(INSTALL_PREFIX)/Qt-$(PKG_VERS)/$(LIBDIR)
CONFIGURE_ARGS += -xplatform $(QT_ARCH) -prefix $(INSTALL_PREFIX) -libdir $(INSTALL_PREFIX)/$(LIBDIR)
CONFIGURE_ARGS += -plugin-gfx-vnc
CONFIGURE_ARGS += -system-zlib -system-libtiff -system-libpng -system-libmng -system-libjpeg -glib -openssl -system-sqlite -exceptions -xmlpatterns
CONFIGURE_ARGS += -webkit -javascript-jit -script -scripttools
CONFIGURE_ARGS += -nomake examples -nomake demos -nomake docs -nomake translations
CONFIGURE_ARGS += -I$(INSTALL_DIR)$(INSTALL_PREFIX)/include -I$(INSTALL_DIR)$(INSTALL_PREFIX)/include/glib-2.0 -I$(INSTALL_DIR)$(INSTALL_PREFIX)/$(LIBDIR)/glib-2.0/include -L$(INSTALL_DIR)$(INSTALL_PREFIX)/$(LIBDIR)

include ../../mk/spksrc.cross-cc.mk

.PHONY: myConfigure
myConfigure:
	$(RUN) CC= CXX= CPP= LD= CFLAGS= CPPFLAGS= LDFLAGS= RANLIB= PATH=`echo ${ENV} | sed -e 's?.*CC=\(.*\)/.*-gcc .*?\1?'`":${PATH}":${PATH} ./configure -v $(CONFIGURE_ARGS)

.PHONY: myCompile
myCompile:
	$(RUN) PATH=`echo ${ENV} | sed -e 's?.*CC=\(.*\)/.*-gcc .*?\1?'`":${PATH}":${PATH} make $(MAKE_OPT)

.PHONY: myInstall
myInstall:
	$(RUN) PATH=`echo ${ENV} | sed -e 's?.*CC=\(.*\)/.*-gcc .*?\1?'`":${PATH}":${PATH} make INSTALL_ROOT=$(INSTALL_DIR) install
