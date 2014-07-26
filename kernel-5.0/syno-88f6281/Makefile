ARCH ?= 88f6281
PKG_NAME = synogpl
PKG_BRANCH = 4458
PKG_ARCH = 6281
PKG_EXT = tbz
PKG_DIST_NAME = $(PKG_NAME)-$(PKG_BRANCH)-$(PKG_ARCH).$(PKG_EXT)
PKG_DIST_SITE = http://downloads.sourceforge.net/project/dsgpl/Synology%20NAS%20GPL%20Source/$(PKG_BRANCH)branch
PKG_EXTRACT = source/linux-2.6.32
PKG_EXTRACT_WIFI = source/compat-wireless
SYNO_CONFIG = synoconfigs/$(ARCH)
SYNO_WIFI_VERSION = v3.12.x
SYNO_WIFI_CONFIG = synoconfigs/MARVELL_88F6281
BASE_ARCH = arm

HOMEPAGE = http://www.synology.com/

include ../../mk/spksrc.kernel-modules.mk
