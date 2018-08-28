#!/bin/sh

# Package
PACKAGE="dnsmasq"
DNAME="dnsmasq"

# Others
INSTALL_DIR="/usr/local/${PACKAGE}"
SSS="/var/packages/${PACKAGE}/scripts/start-stop-status"
TMP_DIR="${SYNOPKG_PKGDEST}/../../@tmp"

preinst ()
{
    exit 0
}

postinst ()
{
    # Link
    ln -s ${SYNOPKG_PKGDEST} ${INSTALL_DIR}
    
    # Put dnsmasq in the PATH

    exit 0
}

preuninst ()
{
    # Stop the package
    ${SSS} stop > /dev/null

    exit 0
}

postuninst ()
{
    # Remove link
    rm -f ${INSTALL_DIR}

    exit 0
}

preupgrade ()
{
    # Stop the package
    ${SSS} stop > /dev/null

    # Setup a clean backup dir
    rm -fr ${TMP_DIR}/${PACKAGE}
    mkdir -p ${TMP_DIR}/${PACKAGE}

    # Save config and scripts
    cd ${INSTALL_DIR} && tar cpf ${TMP_DIR}/${PACKAGE}/conf_backup.tar etc 

    exit 0
}

postupgrade ()
{
    cd ${INSTALL_DIR} && tar xpf ${TMP_DIR}/${PACKAGE}/conf_backup.tar

    exit 0
}
