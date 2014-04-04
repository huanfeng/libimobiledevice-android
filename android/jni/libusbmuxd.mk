#libusbmuxd
LIB_PLIST_VERSION:=libplist

LIB_VERSION:=libusbmuxd

LOCAL_PATH:= $(call my-dir)
LIB_ROOT_REL:= ../../$(LIB_VERSION)
LIB_ROOT_ABS:= $(LOCAL_PATH)/../../$(LIB_VERSION)

include $(CLEAR_VARS)

LOCAL_CFLAGS := -Dlibusbmuxd_EXPORTS -DHAVE_INOTIFY -O2 -fPIC -Wall -lpthread -DANDROID

LOCAL_SRC_FILES := \
 $(LIB_ROOT_REL)/src/collection.c \
 $(LIB_ROOT_REL)/src/libusbmuxd.c \
 $(LIB_ROOT_REL)/src/socket.c

LOCAL_C_INCLUDES += \
 $(LOCAL_PATH)/.. \
 $(LIB_ROOT_ABS)/include \
 $(LIB_ROOT_ABS)/src \
 $(LIB_ROOT_ABS)/../$(LIB_PLIST_VERSION)/include 
  
LOCAL_SHARED_LIBRARIES := libc libplist

LOCAL_MODULE := libusbmuxd

include $(BUILD_SHARED_LIBRARY)


#iproxy

include $(CLEAR_VARS)

LOCAL_CFLAGS := -O2 -Wall -rdynamic

LOCAL_SRC_FILES:= \
 $(LIB_ROOT_REL)/tools/iproxy.c

LOCAL_C_INCLUDES += \
 $(LIB_ROOT_ABS)/include \
 $(LIB_ROOT_ABS)/src

LOCAL_SHARED_LIBRARIES := libc libusbmuxd

LOCAL_MODULE:= iproxy

include $(BUILD_EXECUTABLE)