#libusbmuxd

LIB_USB_VERSION:=libusbx

LIB_VERSION:=usbmuxd

LOCAL_PATH:= $(call my-dir)
LIB_ROOT_REL:= ../../$(LIB_VERSION)
LIB_ROOT_ABS:= $(LOCAL_PATH)/../../$(LIB_VERSION)

include $(CLEAR_VARS)

LOCAL_CFLAGS := -Dlibusbmuxd_EXPORTS -DHAVE_INOTIFY -O2 -fPIC -Wall -lpthread -DANDROID

LOCAL_SRC_FILES := \
 $(LIB_ROOT_REL)/libusbmuxd/libusbmuxd.c \
 $(LIB_ROOT_REL)/libusbmuxd/sock_stuff.c \
 $(LIB_ROOT_REL)/common/utils.c

LOCAL_C_INCLUDES += \
 $(LOCAL_PATH)/.. \
 $(LIB_ROOT_ABS)/common

LOCAL_EXPORT_C_INCLUDES := \
  $(LIB_ROOT_ABS)/libusbmuxd

LOCAL_SHARED_LIBRARIES := libc libusb

LOCAL_MODULE := libusbmuxd

include $(BUILD_SHARED_LIBRARY)


#usbmuxd

include $(CLEAR_VARS)

LOCAL_CFLAGS := -DUSBMUXD_DAEMON -DUSBMUXD_VERSION=\"1.0.8\" -O2 -Wall

LOCAL_SRC_FILES:= \
 $(LIB_ROOT_REL)/daemon/main.c \
 $(LIB_ROOT_REL)/daemon/usb-linux.c \
 $(LIB_ROOT_REL)/daemon/log.c \
 $(LIB_ROOT_REL)/common/utils.c \
 $(LIB_ROOT_REL)/daemon/device.c \
 $(LIB_ROOT_REL)/daemon/client.c

LOCAL_C_INCLUDES += \
 $(LIB_ROOT_ABS)/common \
 $(LIB_ROOT_ABS)/daemon \
 $(LIB_ROOT_ABS)/libusbmuxd \
 $(LIB_ROOT_ABS)/../$(LIB_USB_VERSION)/libusb

LOCAL_SHARED_LIBRARIES := libc libusb libusbmuxd

LOCAL_MODULE:= usbmuxdd

include $(BUILD_EXECUTABLE)


#iproxy

include $(CLEAR_VARS)

LOCAL_CFLAGS := -O2 -Wall -rdynamic

LOCAL_SRC_FILES:= \
 $(LIB_ROOT_REL)/tools/iproxy.c

LOCAL_C_INCLUDES += \
 $(LIB_ROOT_ABS)/libusbmuxd

LOCAL_SHARED_LIBRARIES := libc libusbmuxd

LOCAL_MODULE:= iproxy

include $(BUILD_EXECUTABLE)

