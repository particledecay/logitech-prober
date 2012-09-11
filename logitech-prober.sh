#!/bin/bash

MOUSEBIN=/usr/local/bin/xquery-pointer-x

mousepos=`$MOUSEBIN`
newmousepos=$mousepos

while [ $newmousepos -eq $mousepos ]
do
    modprobe -r hid_logitech_dj && modprobe -r usbhid && modprobe usbhid
    sleep 2
    newmousepos=`$MOUSEBIN`
done
