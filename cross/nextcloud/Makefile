PKG_NAME = nextcloud
PKG_VERS = 15.0.7
PKG_EXT = zip
PKG_DIST_NAME = $(PKG_NAME)-$(PKG_VERS).$(PKG_EXT)
PKG_DIST_SITE = https://download.nextcloud.org/server/releases
PKG_DIR = $(PKG_NAME)-$(PKG_VERS)

DEPENDS =

HOMEPAGE = https://nextcloud.org/
COMMENT  = Nextcloud gives you universal access to your files through a web interface or WebDAV. It also provides a platform to easily view & sync your contacts, calendars and bookmarks across all your devices and enables basic editing right on the web. Installation has minimal server requirements, doesn’t need special permissions and is quick. Nextcloud is extendable via a simple but powerful API for applications and plugins.
LICENSE  = AGPL

EXTRACT_PATH = $(WORK_DIR)/$(PKG_DIR)
CONFIGURE_TARGET = nop
COMPILE_TARGET = nop
INSTALL_TARGET = myInstall

include ../../mk/spksrc.cross-cc.mk

.PHONY: myInstall
myInstall:
	mkdir -p $(STAGING_INSTALL_PREFIX)/share/nextcloud
	tar -cf - -C $(WORK_DIR)/$(PKG_DIR)/$(PKG_NAME) . | tar -xf - -C $(STAGING_INSTALL_PREFIX)/share/nextcloud
