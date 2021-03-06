SPK_NAME = nzbconfig
SPK_VERS = 0.7
SPK_REV = 3
SPK_ICON = src/nzbconfig.png
DSM_UI_DIR = app
DSM_APP_NAME = SYNOCOMMUNITY.NZBConfig.AppInstance

SPK_DEPENDS = "python27>2.7.5-0:python27-virtualenv>1.9.1-0"

MAINTAINER = SynoCommunity
DESCRIPTION = Configuration interface for your packages SABnzbd, NZBGet, SickBeard, SickBeard Custom, CouchPotato and Headphones
DESCRIPTION_FRE = Interface de configuration pour vos paquets SABnzbd, NZBGet, SickBeard, SickBeard Custom, CouchPotato et Headphones
DESCRIPTION_SPN = Interfaz de configuración para los paquetes SABnzbd, NZBGet, SickBeard, SickBeard Custom, CouchPotato y Headphones
RELOAD_UI = yes
DISPLAY_NAME = NZB Config
CHANGELOG = "1. Add support for SickBeard Custom"

INSTALLER_SCRIPT = src/installer.sh
SSS_SCRIPT       = src/dsm-control.sh

INSTALL_PREFIX = /usr/local/$(SPK_NAME)

COPY_TARGET = nop
POST_STRIP_TARGET = nzbconfig_extra_install

override ARCH=

include ../../mk/spksrc.spk.mk

.PHONY: nzbconfig_extra_install
nzbconfig_extra_install: $(STAGING_DIR)/share/requirements.pybundle
	install -m 755 -d $(STAGING_DIR)/var
	install -m 755 -d $(STAGING_DIR)/app
	install -m 644 src/app/config $(STAGING_DIR)/app/config
	install -m 644 src/app/nzbconfig.js $(STAGING_DIR)/app/nzbconfig.js
	install -m 644 src/app/style.css $(STAGING_DIR)/app/style.css
	install -m 755 src/app/nzbconfig.cgi.py $(STAGING_DIR)/app/nzbconfig.cgi
	install -m 755 -d $(STAGING_DIR)/app/application
	install -m 644 src/app/application/* $(STAGING_DIR)/app/application/
	install -m 755 -d $(STAGING_DIR)/app/texts
	for language in enu fre; do \
		install -m 755 -d $(STAGING_DIR)/app/texts/$${language}; \
		install -m 644 src/app/texts/$${language}/strings $(STAGING_DIR)/app/texts/$${language}/strings; \
	done
	install -m 755 -d $(STAGING_DIR)/app/images
	for size in 16 24 32 48; do \
		convert $(SPK_ICON) -thumbnail $${size}x$${size} \
		        $(STAGING_DIR)/app/images/$(SPK_NAME)-$${size}.png ; \
	done
	install -m 644 src/app/images/* $(STAGING_DIR)/app/images/

$(STAGING_DIR)/share/requirements.pybundle:
	@$(MSG) "Bundling requirements"
	install -m 755 -d $(STAGING_DIR)/share
	@cd $(WORK_DIR) && $(PIP) bundle $@ pyextdirect==0.3.1 configobj flask
