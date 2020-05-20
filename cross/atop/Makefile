PKG_NAME = atop
PKG_VERS = 2.5.0
PKG_EXT = tar.gz
PKG_DIST_NAME = $(PKG_NAME)-$(PKG_VERS).$(PKG_EXT)
PKG_DIST_SITE = https://github.com/Atoptool/$(PKG_NAME)/releases/tag/v$(PKG_VERS)
PKG_DIR = $(PKG_NAME)-$(PKG_VERS)

HOMEPAGE = https://github.com/Atoptool/atop
COMMENT  = Atop is an ASCII full-screen performance monitor for Linux that is capable of reporting the activity of all processes (even if processes have finished during the interval), daily logging of system and process activity for long-term analysis, highlighting overloaded system resources by using colors, etcetera.
LICENSE  = GPLv3

GNU_CONFIGURE = 1
WHEELS = 0

CONFIGURE_TARGET = atop_configure
COMPILE_TARGET = atop_compile
INSTALL_TARGET = atop_install
PRE_INSTALL_TARGET = atop_preinstall

DEPENDS = cross/ncurses cross/zlib

include ../../mk/spksrc.cross-cc.mk

.PHONY: atop_configure
atop_configure:

.PHONY: atop_compile
atop_compile:
	@$(RUN) $(MAKE) $(COMPILE_MAKE_OPTIONS)

.PHONY: atop_preinstall
atop_preinstall:

.PHONY: atop_install
atop_install:
	cp ${WORK_DIR}/${PKG_DIR}/atop ${INSTALL_DIR}${INSTALL_PREFIX}/bin/atop
