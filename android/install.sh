#!/bin/bash

PATH_LOCAL_LIB="libs/armeabi-v7a"
PATH_DEVICE_LIB="/data/local/tmp"

# Make the system partition writable
#adb shell su -c "mount -o remount,rw /system"

# Install so
echo "----------Install so--------------"
for S in libiconv.so libxml2.so libplist.so libplist++.so libusb.so libusbmuxd.so libcrypto.so libssl.so libimobiledevice.so libzip.so
do
  adb shell rm "$PATH_DEVICE_LIB/$S"
  adb push "$PATH_LOCAL_LIB/$S" $PATH_DEVICE_LIB
done


# Install binary
echo "----------Install binary--------------"
for B in listdevs openssl usbmuxdd ideviceid ideviceinfo idevicedate idevicediagnostics idevicescreenshot idevicesyslog ideviceinstaller ifuse fusermount
do
  adb shell rm "$PATH_DEVICE_LIB/$B"
  adb push "$PATH_LOCAL_LIB/$B" $PATH_DEVICE_LIB
  adb shell su -c "chmod 0755 $PATH_DEVICE_LIB/$B"
done

# Make the system partition read only again
#adb shell su -c "mount -o remount,ro /system"

# Run listdevs to
adb shell su -c "export LD_LIBRARY_PATH=\$LD_LIBRARY_PATH:$PATH_DEVICE_LIB"
adb shell su -c "export PATH=\$PATH:$PATH_DEVICE_LIB"

echo "----------list usb devs--------------"
adb shell su -c "$PATH_DEVICE_LIB/listdevs"
adb shell su -c "$PATH_DEVICE_LIB/usbmuxdd"
adb shell su -c "$PATH_DEVICE_LIB/ideviceid -l"

echo "----------ls $PATH_DEVICE_LIB--------------"
adb shell su -c "ls $PATH_DEVICE_LIB"