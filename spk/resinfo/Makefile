SPK_NAME = resinfo
SPK_VERS = 0.05
SPK_REV = 1
SPK_ICON = src/resinfo.png
REQUIRED_DSM = 6.1

MAINTAINER = Johan Vromans
DESCRIPTION = A miniature light-weight resource broker.
DISPLAY_NAME = ResInfo
override ARCH =

LICENSE  = Artistic

INSTALLER_SCRIPT = src/installer.sh
SSS_SCRIPT       = src/dsm-control.sh

INSTALL_PREFIX = /usr/local/$(SPK_NAME)
COPY_TARGET = nop
STRIP_TARGET = nop
WHEELS =

POST_STRIP_TARGET =  resinfo_extra_install

include ../../mk/spksrc.spk.mk

.PHONY: resinfo_extra_install
resinfo_extra_install:
	install -m 755 -d $(STAGING_DIR)
	install -m 755 -d $(STAGING_DIR)/etc
	install -m 644 src/resinfo.dat $(STAGING_DIR)/etc/
	install -m 755 -d $(STAGING_DIR)/bin
	install -m 755 src/resinfo $(STAGING_DIR)/bin/
