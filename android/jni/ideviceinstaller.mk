#ideviceinstaller

LIB_IMOBILEDEVICE_VERSION:=libimobiledevice
LIB_PLIST_VERSION:=libplist
LIB_ZIP_VERSION:=libzip-android/libzip

LIB_VERSION:=ideviceinstaller

LOCAL_PATH:= $(call my-dir)
LIB_ROOT_REL:= ../../$(LIB_VERSION)
LIB_ROOT_ABS:= $(LOCAL_PATH)/../../$(LIB_VERSION)

include $(CLEAR_VARS)

LOCAL_CFLAGS := \
 -DHAVE_LIBIMOBILEDEVICE_1_1_5 \
 -DHAVE_LIBIMOBILEDEVICE_1_1

LOCAL_SRC_FILES := \
 $(LIB_ROOT_REL)/src/ideviceinstaller.c

LOCAL_C_INCLUDES += \
 $(LIB_ROOT_ABS)/src \
 $(LIB_ROOT_ABS)/../$(LIB_IMOBILEDEVICE_VERSION)/include \
 $(LIB_ROOT_ABS)/../$(LIB_PLIST_VERSION)/include \
 $(LIB_ROOT_ABS)/../$(LIB_ZIP_VERSION) \

LOCAL_SHARED_LIBRARIES := libimobiledevice libplist libzip

LOCAL_MODULE := ideviceinstaller

include $(BUILD_EXECUTABLE)
