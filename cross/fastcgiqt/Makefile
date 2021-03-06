PKG_NAME = fastcgiqt
PKG_VERS =
PKG_EXT = tar.gz
PKG_DOWNLOAD_METHOD = git
PKG_GIT_HASH = master
PKG_DIST_NAME = fastcgiqt.git
PKG_DIST_SITE = git://github.com/fredemmott
PKG_DIST_FILE = $(PKG_NAME)-git$(PKG_GIT_HASH).$(PKG_EXT)
PKG_DIR = $(PKG_NAME)-git$(PKG_GIT_HASH)

DEPENDS = cross/libqt4-embedded

HOMEPAGE = https://github.com/fredemmott/fastcgiqt
COMMENT  = Library for writing web applications with Qt and C++ 
LICENSE  = https://github.com/fredemmott/fastcgiqt

CONFIGURE_TARGET = myConfigure
INSTALL_TARGET = myInstall

ifneq ($(findstring bromolow,$(ARCH))$(findstring cedarview,$(ARCH))$(findstring pineview,$(ARCH))$(findstring x86,$(ARCH)),)
LIBDIR_SUFFIX=64
else
LIBDIR_SUFFIX=
endif
LIBDIR = lib$(LIBDIR_SUFFIX)

include ../../mk/spksrc.cross-cc.mk

.PHONY: myConfigure
myConfigure:
	$(RUN) cmake . -DCMAKE_INSTALL_PREFIX=$(INSTALL_DIR)$(INSTALL_PREFIX) -DLIB_SUFFIX=$(LIBDIR_SUFFIX) -DCMAKE_LIBRARY_PATH=$(INSTALL_DIR)$(INSTALL_PREFIX)/$(LIBDIR) -DCMAKE_INCLUDE_PATH=$(INSTALL_DIR)$(INSTALL_PREFIX)/include -DWITH_XSLT_SUPPORT=ON -DBUILD_EXAMPLES=ON -DQT_QMAKE_EXECUTABLE=$(INSTALL_DIR)$(INSTALL_PREFIX)/bin/qmake -DQT_MOC_EXECUTABLE=$(INSTALL_DIR)$(INSTALL_PREFIX)/bin/moc -DQT_RCC_EXECUTABLE=$(INSTALL_DIR)$(INSTALL_PREFIX)/bin/rcc -DQT_UIC_EXECUTABLE=$(INSTALL_DIR)$(INSTALL_PREFIX)/bin/uic

.PHONY: myInstall
myInstall:
	$(RUN) mkdir -p $(STAGING_INSTALL_PREFIX)/cgi-bin
	$(RUN) install -m 755 $(WORK_DIR)/$(TC_BASE_DIR)/$(PKG_DIR)/examples/BigWorld/BigWorld $(STAGING_INSTALL_PREFIX)/cgi-bin/BigWorld.cgi
	$(RUN) install -m 755 $(WORK_DIR)/$(TC_BASE_DIR)/$(PKG_DIR)/examples/Dumper/Dumper $(STAGING_INSTALL_PREFIX)/cgi-bin/Dumper.cgi
	$(RUN) install -m 755 $(WORK_DIR)/$(TC_BASE_DIR)/$(PKG_DIR)/examples/EmbedExample/EmbedExample $(STAGING_INSTALL_PREFIX)/cgi-bin/EmbedExample.cgi
	$(RUN) install -m 755 $(WORK_DIR)/$(TC_BASE_DIR)/$(PKG_DIR)/examples/GetGreeter/GetGreeter $(STAGING_INSTALL_PREFIX)/cgi-bin/GetGreeter.cgi
	$(RUN) install -m 755 $(WORK_DIR)/$(TC_BASE_DIR)/$(PKG_DIR)/examples/HelloWorld/HelloWorld $(STAGING_INSTALL_PREFIX)/cgi-bin/HelloWorld.cgi
	$(RUN) install -m 755 $(WORK_DIR)/$(TC_BASE_DIR)/$(PKG_DIR)/examples/PostGreeter/PostGreeter $(STAGING_INSTALL_PREFIX)/cgi-bin/PostGreeter.cgi
	$(RUN) install -m 755 $(WORK_DIR)/$(TC_BASE_DIR)/$(PKG_DIR)/examples/PostStreamExample/PostStreamExample $(STAGING_INSTALL_PREFIX)/cgi-bin/PostStreamExample.cgi
	$(RUN) install -m 755 $(WORK_DIR)/$(TC_BASE_DIR)/$(PKG_DIR)/examples/PrefixExample/PrefixExample $(STAGING_INSTALL_PREFIX)/cgi-bin/PrefixExample.cgi
	$(RUN) install -m 755 $(WORK_DIR)/$(TC_BASE_DIR)/$(PKG_DIR)/examples/ServiceExample/ServiceExample $(STAGING_INSTALL_PREFIX)/cgi-bin/ServiceExample.cgi
	$(RUN) install -m 755 $(WORK_DIR)/$(TC_BASE_DIR)/$(PKG_DIR)/examples/ThreadedDumper/ThreadedDumper $(STAGING_INSTALL_PREFIX)/cgi-bin/ThreadedDumper.cgi
	$(RUN) install -m 755 $(WORK_DIR)/$(TC_BASE_DIR)/$(PKG_DIR)/examples/XsltExample/XsltExample $(STAGING_INSTALL_PREFIX)/cgi-bin/XsltExample.cgi
	$(RUN) install -m 644 $(WORK_DIR)/$(TC_BASE_DIR)/$(PKG_DIR)/examples/XsltExample/example.xsl $(STAGING_INSTALL_PREFIX)/cgi-bin/example.xsl
	$(RUN) make install
