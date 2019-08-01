#!/bin/sh

# Package
PACKAGE="par2cmdline"
DNAME="Par2Cmdline"

# Others
INSTALL_DIR="/usr/local/bin"

preinst ()
{
    exit 0
}

postinst ()
{
    # Link
    ln -s /var/packages/${SYNOPKG_PKGNAME}/target/bin/par2 ${INSTALL_DIR}/par2
    ln -s par2 ${INSTALL_DIR}/par2repair
    ln -s par2 ${INSTALL_DIR}/par2verify
    ln -s par2 ${INSTALL_DIR}/par2create
    
    exit 0
}

preuninst ()
{
    exit 0
}

postuninst ()
{
    # Remove binary and links
    rm -f ${INSTALL_DIR}/par2
    rm -f ${INSTALL_DIR}/par2create
    rm -f ${INSTALL_DIR}/par2repair
    rm -f ${INSTALL_DIR}/par2verify

    exit 0
}

preupgrade ()
{
    exit 0
}

postupgrade ()
{
    exit 0
}
