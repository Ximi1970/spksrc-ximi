SPK_NAME = HelloWorld-FastCGIqt
SPK_VERS = 1.0
SPK_REV = 1
SPK_ICON = src/helloworld-fastcgiqt.png
DSM_UI_DIR = app
BETA = 1

DEPENDS = cross/libqt4-embedded cross/fastcgiqt

MAINTAINER = Ximi1970
DESCRIPTION = Library testing ground. LibQt4-embedded, FastCgiQt.
DESCRIPTION_FRE = Library testing ground. LibQt4-embedded, FastCgiQt.
RELOAD_UI = yes
DISPLAY_NAME = HelloWorld-FastCGIqt

HOMEPAGE   = https://github.com/Ximi1970/spksrc
LICENSE    = GNU GPL

ifneq ($(findstring bromolow,$(ARCH))$(findstring cedarview,$(ARCH))$(findstring pineview,$(ARCH))$(findstring x86,$(ARCH)),)
LIBDIR=lib64
else
LIBDIR=lib
endif

INSTALLER_SCRIPT = src/installer.sh
SSS_SCRIPT       = src/dsm-control.sh
ADDITIONAL_SCRIPTS =

PLIST_TRANSFORM = sed -e 's%@MULTILIB@%$(LIBDIR)%'

INSTALL_PREFIX = /usr/local/$(SPK_NAME)

POST_STRIP_TARGET = extra_install

define \n


endef
ifneq ($(findstring $(ARCH),88f5281 88f6281 armada370 bromolow cedarview pineview evansport powerpc ppc824x ppc853x ppc854x qoriq x86 ),)
$(error ${\n}${\n}Toolchain not compatible.${\n}${\n}Please use:${\n}make arch-$(ARCH)-gcc47${\n}or${\n}make arch-$(ARCH)-gcc48${\n}${\n}You can create the toolchain by running: spk/toolchain-gcc<47|48> arch-$(ARCH)${\n}${\n})
endif

include ../../mk/spksrc.spk.mk

.PHONY: extra_install
extra_install:
	install -m 755 -d $(STAGING_DIR)/app
	install -m 644 src/app/config $(STAGING_DIR)/app/config
	pushd $(STAGING_DIR)/app ; \
	ln -sf ../cgi-bin/BigWorld.cgi BigWorld.cgi ; \
	ln -sf ../cgi-bin/Dumper.cgi ; \
	ln -sf ../cgi-bin/EmbedExample.cgi ; \
	ln -sf ../cgi-bin/GetGreeter.cgi ; \
	ln -sf ../cgi-bin/HelloWorld.cgi ; \
	ln -sf ../cgi-bin/PostGreeter.cgi ; \
	ln -sf ../cgi-bin/PostStreamExample.cgi ; \
	ln -sf ../cgi-bin/PrefixExample.cgi ; \
	ln -sf ../cgi-bin/ServiceExample.cgi ; \
	ln -sf ../cgi-bin/ThreadedDumper.cgi ; \
	ln -sf ../cgi-bin/XsltExample.cgi ; \
	ln -sf ../cgi-bin/example.xsl ; \
	popd
	install -m 755 -d $(STAGING_DIR)/app/images
	for size in 16 24 32 48; do \
		convert $(SPK_ICON) -thumbnail $${size}x$${size} \
		        $(STAGING_DIR)/app/images/$(SPK_NAME)-$${size}.png ; \
	done
