#!/bin/sh

INETD=/usr/bin/inetd
INETD_CONF="/etc/inetd.conf"
TEMP_CONF="/tmp/inetd.$$.conf.tmp"
RI_PORT=1487

check_conf()
{
        if [ ! -f $INETD_CONF ]; then
                touch $INETD_CONF
        fi
}

case $1 in
    start)
        check_conf
        grep -v "^[     ]*${RI_PORT}\([     ]\|$\)" $INETD_CONF > $TEMP_CONF
        echo "${RI_PORT}    stream  tcp     nowait  root    /bin/cat        cat /usr/local/resinfo/etc/resinfo.dat" >> $TEMP_CONF
        mv $TEMP_CONF $INETD_CONF
        initctl restart inetd || initctl start inetd
        exit 0
        ;;

    stop)
        check_conf
        grep -v "^[     ]*${RI_PORT}\([     ]\|$\)" $INETD_CONF > $TEMP_CONF
        mv $TEMP_CONF $INETD_CONF
        grep -qv '^#' $INETD_CONF && initctl restart inetd || initctl stop inetd
        exit 0
        ;;

    status)
        exit 0
        ;;
    log)
        exit 1
        ;;
    *)
        exit 1
        ;;
esac
