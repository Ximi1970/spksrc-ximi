SPK_NAME = mc
SPK_VERS = 4.8.7
SPK_REV = 1
SPK_ICON = src/mc.png

DEPENDS = cross/mc

MAINTAINER = SynoCommunity
DESCRIPTION = Midnight Commander is a console application with a text user interface. The main interface consists of two panels which display the file system.
DESCRIPTION_FRE = Midnight Commander est une application en mode texte. L\\\'interface principale se compose de deux « panneaux » qui affichent les fichiers présents par rapport à leur emplacement sur le disque.
RELOAD_UI = no
DISPLAY_NAME = Midnight Commander
STARTABLE = no

HOMEPAGE   = http://www.midnight-commander.org/
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

include ../../mk/spksrc.spk.mk
