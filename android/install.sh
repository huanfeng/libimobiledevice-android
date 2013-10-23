#!/bin/bash

PATH_LOCAL_LIB="libs/armeabi-v7a"
PATH_SYSTEM_LIB="/system/lib"
PATH_SYSTEM_BIN="/data/local/tmp"

# Make the system partition writable
#adb shell su -c "mount -o remount,rw /system"

# Install so
echo "----------Install so--------------"
for S in libiconv.so libxml2.so libplist.so libplist++.so libusb.so libusbmuxd.so libcrypto.so libssl.so libimobiledevice.so libzip.so libfusemod_subdir.so
do
  adb shell rm "$PATH_SYSTEM_LIB/$S"
  adb push "$PATH_LOCAL_LIB/$S" $PATH_SYSTEM_LIB
done


# Install binary
echo "----------Install binary--------------"
for B in listdevs openssl usbmuxdd ideviceid ideviceinfo idevicedate idevicediagnostics idevicescreenshot idevicesyslog ideviceinstaller ifuse fusermount
do
  adb shell rm "$PATH_SYSTEM_BIN/$B"
  adb push "$PATH_LOCAL_LIB/$B" $PATH_SYSTEM_BIN
  adb shell su -c "chmod 0755 $PATH_SYSTEM_BIN/$B"
done

# Make the system partition read only again
#adb shell su -c "mount -o remount,ro /system"

# Run listdevs to
#adb shell su -c "export LD_LIBRARY_PATH=\$LD_LIBRARY_PATH:$PATH_DEVICE"
#adb shell su -c "export PATH=\$PATH:$PATH_DEVICE"

echo "----------list usb devs--------------"
adb shell su -c "$PATH_SYSTEM_BIN/listdevs"
adb shell su -c "$PATH_SYSTEM_BIN/usbmuxdd"
adb shell su -c "$PATH_SYSTEM_BIN/ideviceid -l"

echo "----------ls $PATH_SYSTEM_BIN--------------"
adb shell su -c "ls $PATH_SYSTEM_BIN"