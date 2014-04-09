#usbmuxd
LIB_PLIST_VERSION:=libplist
LIB_LIBUSBMUXD_VERSION:=libusbmuxd
LIB_USB_VERSION:=libusbx
LIB_IMOBILEDEVICE_VERSION:=libimobiledevice

LIB_VERSION:=usbmuxd

LOCAL_PATH:= $(call my-dir)
LIB_ROOT_REL:= ../../$(LIB_VERSION)
LIB_ROOT_ABS:= $(LOCAL_PATH)/../../$(LIB_VERSION)

include $(CLEAR_VARS)

LOCAL_CFLAGS := -O2 -Wall -lpthread -DPACKAGE_STRING=\"1.0.9\" -DPACKAGE_VERSION=\"1.0.9\" -DPACKAGE_NAME=\"usbmuxd\" -DHAVE_LIBIMOBILEDEVICE -DANDROID

LOCAL_SRC_FILES:= \
 $(LIB_ROOT_REL)/src/log.c \
 $(LIB_ROOT_REL)/src/client.c \
 $(LIB_ROOT_REL)/src/conf.c \
 $(LIB_ROOT_REL)/src/device.c \
 $(LIB_ROOT_REL)/src/main.c \
 $(LIB_ROOT_REL)/src/preflight.c \
 $(LIB_ROOT_REL)/src/usb-linux.c \
 $(LIB_ROOT_REL)/src/utils.c

LOCAL_C_INCLUDES += \
 $(LIB_ROOT_ABS)/src \
 $(LIB_ROOT_ABS)/../$(LIB_PLIST_VERSION)/include \
 $(LIB_ROOT_ABS)/../$(LIB_PLIST_VERSION)/src \
 $(LIB_ROOT_ABS)/../$(LIB_LIBUSBMUXD_VERSION)/include \
 $(LIB_ROOT_ABS)/../$(LIB_LIBUSBMUXD_VERSION)/src \
 $(LIB_ROOT_ABS)/../$(LIB_USB_VERSION)/libusb \
 $(LIB_ROOT_ABS)/../$(LIB_IMOBILEDEVICE_VERSION)/include
  
LOCAL_SHARED_LIBRARIES := libc libplist libusbmuxd libusb libimobiledevice
LOCAL_LDLIBS := -llog

LOCAL_MODULE:= usbmuxdd

include $(BUILD_EXECUTABLE)



