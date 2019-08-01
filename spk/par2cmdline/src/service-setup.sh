
service_postinst ()
{
    # Put par2cmdline in the PATH
    mkdir -p /usr/local/bin
    ln -s /var/packages/${SYNOPKG_PKGNAME}/target/bin/par2 /usr/local/bin/par2
    ln -s par2 /usr/local/bin/par2repair
    ln -s par2 /usr/local/bin/par2verify
    ln -s par2 /usr/local/bin/par2create
}

service_postuninst ()
{
    # Remove link
    rm -f /usr/local/bin/par2
    rm -f /usr/local/bin/par2create
    rm -f /usr/local/bin/par2repair
    rm -f /usr/local/bin/par2verify
}
