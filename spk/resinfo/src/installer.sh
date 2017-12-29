#!/bin/sh

# Package
PACKAGE="resinfo"
DNAME="ResInfo"

# Others
INSTALL_DIR="/usr/local/${PACKAGE}"
INSTALL_DIR_PERL="/usr/local/lib/perl5/site_perl"


preinst ()
{
    exit 0
}

postinst ()
{
    # Link
    ln -s ${SYNOPKG_PKGDEST} ${INSTALL_DIR}
    
    mkdir -p /usr/local/bin
    ln -s ${INSTALL_DIR}/bin/resinfo /usr/local/bin/resinfo
    ln -s ${INSTALL_DIR}/etc/resinfo.dat /usr/local/etc/resinfo.dat
    install -m 755 ${INSTALL_DIR}/bin/resinfo ${INSTALL_DIR_PERL}/ResInfo.pm

    exit 0
}

preuninst ()
{
    exit 0
}

postuninst ()
{
    # Remove link
    rm -f ${INSTALL_DIR}
    rm -f /usr/local/bin/resinfo
    rm -f /usr/local/etc/resinfo.dat
    rm -f ${INSTALL_DIR_PERL}/ResInfo.pm

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
