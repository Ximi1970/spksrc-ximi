PKG_NAME = rtl8812au_rtl8821au
PKG_VERS =
PKG_EXT = tar.gz
PKG_DOWNLOAD_METHOD = git
#PKG_GIT_HASH = 935057fae7df3208acf57b577455480dee248166
PKG_GIT_HASH = 6b9092c4ad516ae71325d3659b74369bc4f53a20
PKG_DIST_NAME = rtl8812AU_8821AU_linux.git
PKG_DIST_SITE = git://github.com/abperiasamy
PKG_DIST_FILE = $(PKG_NAME)-git$(PKG_GIT_HASH).$(PKG_EXT)
PKG_DIR = $(PKG_NAME)-git$(PKG_GIT_HASH)

REQ_KERNEL = 1

DEPENDS =

HOMEPAGE = https://github.com/abperiasamy/rtl8812AU_8821AU_linux
COMMENT  = rtl8812AU_8821AU linux kernel driver for AC1200 (801.11ac) Wireless Dual-Band USB Adapter

LICENSE  = GPLv2

CONFIGURE_TARGET = myConfigure
COMPILE_TARGET = myCompile
INSTALL_TARGET = myInstall

KERNEL_CODE=$(shell cat $(KERNEL_DIR)/../../include/linux/version.h | grep LINUX_VERSION | sed -e "s/.*LINUX_VERSION.* \([0-9]*\)/\1/" )
KERNEL_VER=$(shell echo $$(( $(KERNEL_CODE) >> 16 ))"."$$(( ( $(KERNEL_CODE) >> 8 ) & 255 ))"."$$(( $(KERNEL_CODE) & 255 )) )

include ../../mk/spksrc.cross-cc.mk

.PHONY: myConfigure
myConfigure:
	$(RUN) sed -e 's#CONFIG_PLATFORM_I386_PC = y#CONFIG_PLATFORM_I386_PC = n#' -i Makefile
	$(RUN) sed -e 's#.*depmod.*##' -i Makefile

.PHONY: myCompile
myCompile:
	$(RUN) make USER_EXTRA_CFLAGS="-DCONFIG_LITTLE_ENDIAN" CROSS_COMPILE="$(TC_PATH)$(TC_TARGET)-" KVER=$(KERNEL_VER) KSRC=$(KERNEL_DIR) MODDESTDIR=$(INSTALL_DIR)$(INSTALL_PREFIX)/modules

.PHONY: myInstall
myInstall:
	$(RUN) mkdir -p $(INSTALL_DIR)$(INSTALL_PREFIX)/modules
	$(RUN) make MODDESTDIR=$(INSTALL_DIR)$(INSTALL_PREFIX)/modules install
