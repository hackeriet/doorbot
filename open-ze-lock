#!/bin/bash

DOOR_STATE_FILE=/sys/class/gpio/gpio25/value

stty -F /dev/ttyACM0 9600 cs8 cread clocal

if [ ! -f $DOOR_STATE_FILE ] ; then
  echo 25 > /sys/class/gpio/export
  echo out > /sys/class/gpio/gpio25/direction
fi


echo Granted $(echo $g | cut -d: -f1) access
echo Granted $(echo $g | cut -d: -f1) access | logger -t opendoor
echo 1 > /sys/class/gpio/gpio25/value
echo get on the floor
sleep 2
echo everybody do the dinosaur
echo 0 > /sys/class/gpio/gpio25/value
