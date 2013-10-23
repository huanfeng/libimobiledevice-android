#idevice

LIB_PLIST_VERSION:=libplist
LIB_IMOBILEDEVICE_VERSION:=libimobiledevice
LIB_ZIP_VERSION:=libzip
LIB_VERSION:=idevice

LOCAL_PATH:= $(call my-dir)
LIB_ROOT_REL:= ../../$(LIB_VERSION)
LIB_ROOT_ABS:= $(LOCAL_PATH)/../../$(LIB_VERSION)

include $(CLEAR_VARS)

LOCAL_CFLAGS := \
 -DANDROID

LOCAL_SRC_FILES := \
 $(LIB_ROOT_REL)/org_uiautomation_iosdriver_services_DeviceManagerService.c \
 $(LIB_ROOT_REL)/org_uiautomation_iosdriver_services_DeviceInstallerService.c \
 $(LIB_ROOT_REL)/org_uiautomation_iosdriver_services_LoggerService.c \
 $(LIB_ROOT_REL)/org_uiautomation_iosdriver_services_WebInspectorService.c \

LOCAL_C_INCLUDES += \
 $(LIB_ROOT_ABS) \
 $(LIB_ROOT_ABS)/../$(LIB_IMOBILEDEVICE_VERSION)/src \
 $(LIB_ROOT_ABS)/../$(LIB_IMOBILEDEVICE_VERSION)/common \
 $(LIB_ROOT_ABS)/../$(LIB_IMOBILEDEVICE_VERSION)/include \
 $(LIB_ROOT_ABS)/../$(LIB_PLIST_VERSION)/include \
 $(LIB_ROOT_ABS)/../$(LIB_ZIP_VERSION) \
 
LOCAL_SHARED_LIBRARIES := libplist libimobiledevice libzip

LOCAL_MODULE := libidevice

include $(BUILD_SHARED_LIBRARY)
