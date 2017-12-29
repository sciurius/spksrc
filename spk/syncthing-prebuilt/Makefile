SPK_NAME = syncthing
SPK_VERS = 0.14.42
SPK_REV = 14
SPK_ICON = src/syncthing.png
DSM_UI_DIR = app

DEPENDS = cross/busybox cross/syncthing-prebuilt

UNSUPPORTED_ARCHS = $(PPC_ARCHES)

MAINTAINER = cytec
DESCRIPTION = Automatically sync files via secure, distributed technology.
DESCRIPTION_FRE = Synchronisation automatique de fichiers via une technologie sûre et distribuée.
ADMIN_PORT = 7070
RELOAD_UI = yes
DISPLAY_NAME = Syncthing
CHANGELOG = "Upgrade to 0.14.42"
HOMEPAGE = http://www.syncthing.net
LICENSE = MPLv2.0

INSTALLER_SCRIPT = src/installer.sh
SSS_SCRIPT       = src/dsm-control.sh
FWPORTS          = src/${SPK_NAME}.sc
CONF_DIR         = src/conf/
WIZARDS_DIR      = wizard/

BUSYBOX_CONFIG = daemon nice
ENV += BUSYBOX_CONFIG="$(BUSYBOX_CONFIG)"

INSTALL_PREFIX = /usr/local/$(SPK_NAME)

POST_STRIP_TARGET = syncthing_extra_install

include ../../mk/spksrc.spk.mk

.PHONY: syncthing_extra_install
syncthing_extra_install:
	install -m 755 -d $(STAGING_DIR)/var
	install -m 600 src/config.xml $(STAGING_DIR)/var/config.xml
	install -m 644 src/options.conf $(STAGING_DIR)/var/options.conf
	install -m 755 -d $(STAGING_DIR)/app
	install -m 644 src/app/config $(STAGING_DIR)/app/config
