#!/bin/bash

source /pkgscripts/include/pkg_util.sh

package="minimalPkg"
version="1.0.0000"
displayname="Minimal Package"
maintainer="Synology Inc."
arch="$(pkg_get_unified_platform)"
description="this is a minimal package"

[ "$(caller)" != "0 NULL" ] && return 0

pkg_dump_info
