PKG_NAME = binutils
PKG_VERS = 2.24
PKG_EXT = tar.bz2
PKG_DIST_NAME = $(PKG_NAME)-$(PKG_VERS).$(PKG_EXT)
PKG_DIST_SITE = http://ftp.gnu.org/gnu/binutils
PKG_DIR = $(PKG_NAME)-$(PKG_VERS)

DEPENDS =

HOMEPAGE = http://www.gnu.org/software/binutils/
COMMENT  = A collection of binary tools
LICENSE  = GPL


CONFIGURE_TARGET = myConfigure
COMPILE_TARGET = myCompile
INSTALL_TARGET = myInstall


ifeq ($(MAKE_TOOLCHAIN_TARGET),)
$(error This package is part of a toolchain. Please start with the package: spk/toolchain-gcc[47|48|49] arch-<arch> )
endif

ifneq ($(findstring $(MAKE_TOOLCHAIN_GCC_VER), 47 48 49),)
TOOLCHAIN_PATH = $(WORK_DIR)/../../../toolchains/syno-$(ARCH)-gcc$(MAKE_TOOLCHAIN_GCC_VER)/work/$(MAKE_TOOLCHAIN_TARGET)
else
$(error This package is part of a toolchain. Please start with the package: spk/toolchain-gcc[47|48|49] arch-<arch> )
endif


COOKIE_PREFIX=$(PKG_NAME)-$(ARCH)-gcc$(MAKE_TOOLCHAIN_GCC_VER)-


CONFIGURE_ARGS =  --build=$$BUILD_HOST --host=$$BUILD_HOST
CONFIGURE_ARGS += --target=$(MAKE_TOOLCHAIN_TARGET) --prefix=$(TOOLCHAIN_PATH)
CONFIGURE_ARGS += --with-sysroot=$(TOOLCHAIN_PATH)/$(MAKE_TOOLCHAIN_TARGET)/sys-root/usr/local/toolchain-gcc$(MAKE_TOOLCHAIN_GCC_VER)
CONFIGURE_ARGS += --disable-nls --disable-multilib


include ../../mk/spksrc.native-cc.mk


.PHONY: myConfigure
myConfigure:
	$(RUN) echo ; \
		export BUILD_HOST=`echo ${MACHTYPE} | sed -e 's/-\([^-]*\)/-build_\1/'` ; \
		cd .. ; \
		mkdir -p work-$(ARCH)-gcc$(MAKE_TOOLCHAIN_GCC_VER)/build ; \
		if [ -f $(PKG_DIR)/configure ] ; then mv $(PKG_DIR) work-$(ARCH)-gcc$(MAKE_TOOLCHAIN_GCC_VER) ; fi ; \
		mkdir $(PKG_DIR) ; \
		cd work-$(ARCH)-gcc$(MAKE_TOOLCHAIN_GCC_VER)/build ; \
		../$(PKG_DIR)/configure $(CONFIGURE_ARGS)

.PHONY: myCompile
myCompile:
	$(RUN) echo ;\
		cd ../work-$(ARCH)-gcc$(MAKE_TOOLCHAIN_GCC_VER)/build ; \
		make $(MAKE_OPT)

.PHONY: myInstall
myInstall:
	$(RUN) echo ; \
		cd ../work-$(ARCH)-gcc$(MAKE_TOOLCHAIN_GCC_VER)/build ; \
		make install
