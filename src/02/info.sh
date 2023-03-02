#!/bin/bash

function get_info {

    HOSTNAME=`hostname`
    TIMEZONE=`timedatectl | grep "Time zone" | awk '{print $3,$4,$5}'`
    USER=`whoami`
    OS=`uname -mrs`
    DATE=`date | awk '{print $2,$3,$4,$5}'`
    UPTIME=`uptime -p`
    UPTIME_SEC=`cat /proc/uptime | awk '{print $1}'`
    NET_CARD=`ip -4 a | grep -e "2:" | awk -F ': ' '{print $2}'`
    IP=`hostname -I | awk '{print $1}'`
    MASK=`ip -4 a | grep $NET_CARD | grep scope | awk '{print $4}'`
    GATEWAY=`ip route | grep $NET_CARD | grep default | awk '{print $3}'`
    RAM_TOTAL=`free | grep Mem: | awk '{print $2}'`
    RAM_USED=`free | grep Mem: | awk '{print $3}'`
    RAM_FREE=`free | grep Mem: | awk '{print $7}'`
    SPACE_ROOT=`df | grep '/$' | awk '{print $2}'`
    SPACE_ROOT_USED=`df | grep '/$' | awk '{print $3}'`
    SPACE_ROOT_FREE=`df | grep '/$' | awk '{print $4}'`

    RAM_TOTAL=$(bc<<<"scale=3; $RAM_TOTAL/1024/1024")" Gb"
    RAM_USED=$(bc<<<"scale=3; $RAM_USED/1024/1024")" Gb"
    RAM_FREE=$(bc<<<"scale=3; $RAM_FREE/1024/1024")" Gb"

    SPACE_ROOT=$(bc<<<"scale=3; $SPACE_ROOT/1024/1024")" Gb"
    SPACE_ROOT_USED=$(bc<<<"scale=3; $SPACE_ROOT_USED/1024/1024")" Gb"
    SPACE_ROOT_FREE=$(bc<<<"scale=3; $SPACE_ROOT_FREE/1024/1024")" Gb"
}

list="HOSTNAME TIMEZONE USER OS DATE UPTIME UPTIME_SEC 
      IP MASK GATEWAY RAM_TOTAL RAM_USED RAM_FREE 
      SPACE_ROOT SPACE_ROOT_USED SPACE_ROOT_FREE"

