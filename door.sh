#!/bin/bash

stty -F /dev/ttyACM0 9600 cs8 cread clocal

if [ ! -f /sys/class/gpio/gpio25/value ] ; then
  echo 25 > /sys/class/gpio/export
  echo out > /sys/class/gpio/gpio25/direction
fi


while : ; do
  read l < /dev/ttyACM0
  l=$(echo $l | sed 's/\r//g')
  g=$(grep -H "$l" users/*)
  result=$?
  if [ "$result" -eq 0 ] ; then
    echo `date` Granted $(echo $g | cut -d: -f1) access
    echo 1 > /sys/class/gpio/gpio25/value
    echo get on the floor
    sleep 2
    echo everybody do the dinosaur
    echo 0 > /sys/class/gpio/gpio25/value
  else
    echo "$l not recognized!"
  fi
done

