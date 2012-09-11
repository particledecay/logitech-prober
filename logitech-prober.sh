#!/bin/bash

MOUSEBIN=/usr/local/bin/xquery-pointer-x

mousepos=`$MOUSEBIN`
newmousepos=$mousepos

while [ $newmousepos -eq $mousepos ]
do
    sudo modprobe -r hid_logitech_dj && sudo modprobe -r usbhid && sudo modprobe usbhid
    sleep 2
    newmousepos=`$MOUSEBIN`
done
