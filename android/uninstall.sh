#!/bin/bash

PATH_LOCAL_LIB="libs/armeabi-v7a"
PATH_SYSTEM_LIB="/system/lib"
PATH_SYSTEM_BIN="/data/local/tmp"

# Make the system partition writable
#adb shell su -c "mount -o remount,rw /system"

# Install so
echo "----------Uninstall so--------------"
for S in libiconv.so libxml2.so libplist.so libplist++.so libusb.so libusbmuxd.so libcrypto.so libssl.so libimobiledevice.so libzip.so libfusemod_subdir.so
do
  adb shell rm "$PATH_SYSTEM_LIB/$S"
done


# Install binary
echo "----------Uninstall binary--------------"
for B in listdevs openssl usbmuxdd ideviceid ideviceinfo idevicedate idevicediagnostics idevicescreenshot idevicesyslog ideviceinstaller ifuse fusermount
do
  adb shell rm "$PATH_SYSTEM_BIN/$B"
done

# Make the system partition read only again
#adb shell su -c "mount -o remount,ro /system"


echo "----------ls $PATH_SYSTEM_BIN--------------"
adb shell su -c "ls $PATH_SYSTEM_BIN"

echo "----------list usb devs--------------"
adb shell su -c "listdevs"