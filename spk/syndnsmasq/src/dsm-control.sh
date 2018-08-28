#!/bin/sh

PKGNAME="dnsmasq"
PKGPATH="/var/packages/"${PKGNAME}

DNSPKG=`ls -l ${PKGPATH}/target | awk -F "-> " '{print $2}'`

BINPATH="/usr/bin"
CONFPATH="etc"
LOGPATH="/var/log"
PIDPATH="/var/run"
LEASEPATH="lease"

DNSBIN="dnsmasq"
DNSCONF="dnsmasq.conf"
DNSLOG="dnsmasq.log" 
DNSLEASE="dnsmasq.lease" 

PID_FILE=${PIDPATH}/${PKGNAME}.pid
LOG_FILE=${LOGPATH}/${DNSLOG}

DNSSTART=${BINPATH}/${DNSBIN}
DNSSTART=${DNSSTART}" --conf-file=${DNSPKG}/${CONFPATH}/${DNSCONF}"
DNSSTART=${DNSSTART}" --log-facility=${LOG_FILE}"
DNSSTART=${DNSSTART}" --dhcp-leasefile=${DNSPKG}/${LEASEPATH}/${DNSLEASE}"

start_daemon ()
{
    ${DNSSTART}
}

stop_daemon ()
{
    if daemon_status; then
        echo Stopping ${PKGNAME} ...
        kill `cat ${PID_FILE}`
        wait_for_status 1 20 || kill -9 `cat ${PID_FILE}`
    else
        echo ${PKGNAME} is not running
        exit 0
    fi

    test -e ${PID_FILE} || rm -f ${PID_FILE}
}

daemon_status ()
{
    if [ -f ${PID_FILE} ] && kill -0 `cat ${PID_FILE}` > /dev/null 2>&1; then
        return
    fi
    rm -f ${PID_FILE}
    return 1
}

wait_for_status ()
{
    counter=$2
    while [ ${counter} -gt 0 ]; do
        daemon_status
        [ $? -eq $1 ] && return
        let counter=counter-1
        sleep 1
    done
    return 1
}

case $1 in
    start)
        if daemon_status; then
            echo ${PKGNAME} is already running
            exit 0
        else
            echo Starting ${PKGNAME} ...
            start_daemon
            exit $?
        fi
        ;;
    stop)
            stop_daemon
            exit $?
        ;;
    restart)
        stop_daemon
        start_daemon
        exit $?
        ;;
    status)
        if daemon_status; then
            echo ${PKGNAME} is running
            exit 0
        else
            echo ${PKGNAME} is not running
            exit 1
        fi
        ;;
    log)
        echo ${LOG_FILE}
        ;;
    *)
        exit 1
        ;;
esac
