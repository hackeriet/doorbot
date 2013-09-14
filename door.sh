#!/bin/bash

LOGFILE=/var/log/door.log

stty -F /dev/ttyACM0 9600 cs8 cread clocal

if [ ! -f /sys/class/gpio/gpio25/value ] ; then
  echo 25 > /sys/class/gpio/export
  echo out > /sys/class/gpio/gpio25/direction
fi


while : ; do
  read l < /dev/ttyACM0
  l=$(echo $l | sed 's/\r//g' | sed 's/[^0-9, ]//')
  g=$(grep -H "$l" /home/pi/users/*)
  result=$?
  if [ "$result" -eq 0 ] ; then
    echo `date` - Granted $(echo $g | cut -d: -f1) access >> $LOGFILE
    opendoor >> $LOGFILE 
  else
    echo "`date` - $l not recognized!" >> $LOGFILE
  fi
done

