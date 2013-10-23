#libusb

LIB_VERSION:=libusbx

LOCAL_PATH:= $(call my-dir)
LIB_ROOT_REL:= ../../$(LIB_VERSION)
LIB_ROOT_ABS:= $(LOCAL_PATH)/../../$(LIB_VERSION)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
 $(LIB_ROOT_REL)/libusb/core.c \
 $(LIB_ROOT_REL)/libusb/descriptor.c \
 $(LIB_ROOT_REL)/libusb/hotplug.c \
 $(LIB_ROOT_REL)/libusb/io.c \
 $(LIB_ROOT_REL)/libusb/sync.c \
 $(LIB_ROOT_REL)/libusb/strerror.c \
 $(LIB_ROOT_REL)/libusb/os/linux_usbfs.c \
 $(LIB_ROOT_REL)/libusb/os/poll_posix.c \
 $(LIB_ROOT_REL)/libusb/os/threads_posix.c \
 $(LIB_ROOT_REL)/libusb/os/linux_netlink.c

LOCAL_C_INCLUDES += \
 $(LIB_ROOT_ABS)/libusb \
 $(LIB_ROOT_ABS)/libusb/os \
 $(LIB_ROOT_ABS)/android

LOCAL_LDLIBS := -llog

LOCAL_MODULE := libusb

include $(BUILD_SHARED_LIBRARY)


# listdevs

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
  $(LIB_ROOT_REL)/examples/listdevs.c

LOCAL_C_INCLUDES := \
  $(LIB_ROOT_ABS)/libusb

LOCAL_SHARED_LIBRARIES := libusb

LOCAL_MODULE:= listdevs

include $(BUILD_EXECUTABLE)
