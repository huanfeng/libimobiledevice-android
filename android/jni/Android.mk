LOCAL_PATH:= $(call my-dir)

include $(LOCAL_PATH)/libiconv.mk
include $(LOCAL_PATH)/libxml2.mk
include $(LOCAL_PATH)/libplist.mk
include $(LOCAL_PATH)/libusbmuxd.mk

include $(LOCAL_PATH)/libusbx.mk

include $(LOCAL_PATH)/openssl.mk

include $(LOCAL_PATH)/libimobiledevice.mk

include $(LOCAL_PATH)/usbmuxd.mk

include $(LOCAL_PATH)/libzip.mk
include $(LOCAL_PATH)/ideviceinstaller.mk

#include $(LOCAL_PATH)/libfuse.mk
#include $(LOCAL_PATH)/ifuse.mk

#include $(LOCAL_PATH)/idevice.mk

