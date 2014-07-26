SPK_NAME = hostapd
SPK_VERS = 2.2
SPK_REV = 1
SPK_ICON = src/hostapd.png
DSM_UI_DIR = app
BETA = 1

DEPENDS = cross/hostapd

MAINTAINER = Ximi1970
DESCRIPTION = User space daemon for access point and authentication servers.
DESCRIPTION_FRE = User space daemon for access point and authentication servers.
RELOAD_UI = yes
DISPLAY_NAME = Hostapd

HOMEPAGE   = http://w1.fi/hostapd
LICENSE    = BSD/GPL v2

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

include ../../mk/spksrc.spk.mk
