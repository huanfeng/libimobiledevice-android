#!/bin/bash

PATH_LOCAL_LIB="libs/armeabi-v7a"
PATH_DEVICE_LIB="/vendor/lib"
PATH_DEVICE_BIN="/vendor/bin"

# Make the system partition writable
#adb shell su -c "mount -o remount,rw /system"

echo "----------uninstall deamon----------"
adb shell su -c "$PATH_DEVICE_BIN/usbmuxdd -x"

echo "----------uninstall so--------------"
for S in libiconv.so libxml2.so libplist.so libplist++.so libusb.so libusbmuxd.so libcrypto.so libssl.so libimobiledevice.so libzip.so
do
  adb shell rm "$PATH_DEVICE_LIB/$S"
done


echo "----------uninstall binary--------------"
for B in listdevs openssl usbmuxdd ideviceid ideviceinfo idevicecrashreport idevicedate idevicename idevicediagnostics idevicescreenshot idevicesyslog ideviceinstaller ifuse fusermount
do
  adb shell rm "$PATH_DEVICE_BIN/$B"
done

# Make the system partition read only again
#adb shell su -c "mount -o remount,ro /system"


echo "----------ls $PATH_DEVICE_LIB--------------"
adb shell su -c "ls $PATH_DEVICE_LIB"

echo "----------list usb devs--------------"
adb shell su -c "listdevs"