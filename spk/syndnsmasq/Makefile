SPK_NAME = dnsmasq
SPK_VERS = 0.0
SPK_REV = 8
SPK_ICON = src/icon.png

MAINTAINER = Johan Vromans
DESCRIPTION = Convenient wrapper scripts to control the dnsmasq simple DHCP/DNS server for private use.
RELOAD_UI = no
DISPLAY_NAME = SynDnsmasq
STARTABLE = no
CHANGELOG = "1. Reverse engineered version"

# We actually do not provide the dnsmasq binary, since that is
# included in DSM.
REQUIRED_DSM = 6.1

LICENSE    = GPLv2

INSTALLER_SCRIPT = src/installer.sh
INSTALL_PREFIX = /usr/local/$(SPK_NAME)
SSS_SCRIPT       = src/dsm-control.sh

COPY_TARGET = nop
POST_STRIP_TARGET = custom_extra_install

# Pure script package, make sure ARCH is not defined
override ARCH=

include ../../mk/spksrc.spk.mk

.PHONY: custom_extra_install
custom_extra_install:
	install -d $(STAGING_DIR)/etc
	install -m 644 src/${SPK_NAME}.conf $(STAGING_DIR)/etc/${SPK_NAME}.conf
