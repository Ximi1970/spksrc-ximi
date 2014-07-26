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
	$(RUN) echo ; cd hostapd ;  $(MAKE) V=1 $(MAKE_OPT) EXTRA_CFLAGS="-I$(INSTALL_DIR)/$(INSTALL_PREFIX)/include/libnl3" EXTRA_LIBS="-L$(INSTALL_DIR)/$(INSTALL_PREFIX)/lib64 -L$(INSTALL_DIR)/lib"

.PHONY: myInstall
myInstall:
	$(RUN) echo ; cd hostapd ; \
		install -m 755 hostapd $(INSTALL_DIR)/$(INSTALL_PREFIX)/sbin ; \
		install -m 755 hostapd_cli $(INSTALL_DIR)/$(INSTALL_PREFIX)/sbin ; \
		install -m 600 hostapd.conf $(INSTALL_DIR)/$(INSTALL_PREFIX)/etc ; \
		install -m 644 hostapd.accept $(INSTALL_DIR)/$(INSTALL_PREFIX)/etc ; \
		install -m 644 hostapd.deny $(INSTALL_DIR)/$(INSTALL_PREFIX)/etc ; \
		install -m 600 hostapd.eap_user $(INSTALL_DIR)/$(INSTALL_PREFIX)/etc ; \
		install -m 600 hostapd.radius_clients $(INSTALL_DIR)/$(INSTALL_PREFIX)/etc ; \
		install -m 644 hostapd.sim_db $(INSTALL_DIR)/$(INSTALL_PREFIX)/etc ; \
		install -m 644 hostapd.vlan $(INSTALL_DIR)/$(INSTALL_PREFIX)/etc ; \
		install -m 600 hostapd.wpa_psk $(INSTALL_DIR)/$(INSTALL_PREFIX)/etc
