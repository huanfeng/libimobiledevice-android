#!/bin/bash

PATH_LOCAL_LIB="libs/armeabi-v7a"
PATH_DEVICE_LIB="/vendor/lib"
PATH_DEVICE_BIN="/vendor/bin"

# Make the system partition writable
#adb shell su -c "mount -o remount,rw /system"

# Init Env∂∂∂
adb shell su -c "mkdir /vendor/lib"
adb shell su -c "mkdir /vendor/lib"
adb shell su -c "mkdir /var/lib"
adb shell su -c "mkdir /var/run"

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
  adb shell rm "$PATH_DEVICE_BIN/$B"
  adb push "$PATH_LOCAL_LIB/$B" $PATH_DEVICE_BIN
  adb shell su -c "chmod 0755 $PATH_DEVICE_BIN/$B"
done

# Make the system partition read only again
#adb shell su -c "mount -o remount,ro /system"

# Run listdevs to
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/data/local/tmp
#adb shell su -c "export LD_LIBRARY_PATH=\$LD_LIBRARY_PATH:$PATH_DEVICE_LIB"
#adb shell su -c "export PATH=\$PATH:$PATH_DEVICE_LIB"

echo "----------list usb devs--------------"
adb shell su -c "$PATH_DEVICE_BIN/listdevs"
adb shell su -c "$PATH_DEVICE_BIN/usbmuxdd -v"
adb shell su -c "$PATH_DEVICE_BIN/ideviceid -l"

echo "----------ls $PATH_DEVICE_BIN--------------"
adb shell su -c "ls /vendor/bin"