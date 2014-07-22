PKG_NAME = rtl8812au
PKG_VERS =
PKG_EXT = tar.gz
PKG_DOWNLOAD_METHOD = git
PKG_GIT_HASH = 935057fae7df3208acf57b577455480dee248166
PKG_DIST_NAME = rtl8812AU_8821AU_linux.git
PKG_DIST_SITE = git://github.com/abperiasamy
PKG_DIST_FILE = $(PKG_NAME)-git$(PKG_GIT_HASH).$(PKG_EXT)
PKG_DIR = $(PKG_NAME)-git$(PKG_GIT_HASH)

REQ_KERNEL = 1

DEPENDS =

HOMEPAGE = https://github.com/abperiasamy/rtl8812AU_8821AU_linux
COMMENT  = rtl8812AU linux kernel driver for AC1200 (801.11ac) Wireless Dual-Band USB Adapter

LICENSE  = GPLv2

CONFIGURE_TARGET = myConfigure
COMPILE_TARGET = myCompile
INSTALL_TARGET = myInstall

KERNEL_CODE=$(shell cat $(KERNEL_DIR)/../../include/linux/version.h | grep LINUX_VERSION | sed -e "s/.*LINUX_VERSION.* \([0-9]*\)/\1/" )
KERNEL_VER=$(shell echo $$(( $(KERNEL_CODE) >> 16 ))"."$$(( ( $(KERNEL_CODE) >> 8 ) & 255 ))"."$$(( $(KERNEL_CODE) & 255 )) )


define \n


endef
#ifneq ($(findstring $(ARCH),88f6281 88f5281 powerpc ppc824x ppc853x ppc854x qoriq ),)
#$(error ${\n}${\n}Architecture not supported.${\n}${\n})
#endif


include ../../mk/spksrc.cross-cc.mk


.PHONY: myConfigure
myConfigure:
	$(RUN) sed -e 's#CONFIG_PLATFORM_I386_PC = y#CONFIG_PLATFORM_I386_PC = n#' -i Makefile
	$(RUN) sed -e 's#.*depmod.*##' -i Makefile

.PHONY: myCompile
myCompile:
#	$(RUN) LDFLAGS= $(MAKE) V=1 USER_EXTRA_CFLAGS="-I$(KERNEL_DIR)/../compat-wireless/v3.12.x/include/uapi -I$(KERNEL_DIR)/../compat-wireless/v3.12.x/include -DCONFIG_LITTLE_ENDIAN" CROSS_COMPILE="$(TC_PATH)$(TC_TARGET)-" KVER="3.12.0" KSRC=$(KERNEL_DIR) MODDESTDIR=$(INSTALL_DIR)$(INSTALL_PREFIX)/modules
	$(RUN) cp -f $(KERNEL_DIR)/include/linux/version.h $(KERNEL_DIR)/include/linux/version.orig.h ; sed -i "s/.*LINUX_VERSION_CODE.*/#define LINUX_VERSION_CODE 199680/" $(KERNEL_DIR)/include/linux/version.h
	$(RUN) LDFLAGS= $(MAKE) V=1 USER_EXTRA_CFLAGS="-DCONFIG_LITTLE_ENDIAN" CROSS_COMPILE="$(TC_PATH)$(TC_TARGET)-" KSRC=$(KERNEL_DIR) MODDESTDIR=$(INSTALL_DIR)$(INSTALL_PREFIX)/modules
	$(RUN) cp -f $(KERNEL_DIR)/include/linux/version.orig.h $(KERNEL_DIR)/include/linux/version.h
	
.PHONY: myInstall
myInstall:
	$(RUN) mkdir -p $(INSTALL_DIR)$(INSTALL_PREFIX)/modules
	$(RUN) $(MAKE) MODDESTDIR=$(INSTALL_DIR)$(INSTALL_PREFIX)/modules install
