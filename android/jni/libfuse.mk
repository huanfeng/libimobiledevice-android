#libfuse

LIB_VERSION:=libfuse-android/libfuse

LOCAL_PATH:= $(call my-dir)
LIB_ROOT_REL:= ../../$(LIB_VERSION)
LIB_ROOT_ABS:= $(LOCAL_PATH)/../../$(LIB_VERSION)

include $(CLEAR_VARS)

LOCAL_CFLAGS := \
 -DANDROID \
 -DHAVE_CONFIG_H \
 -D_FILE_OFFSET_BITS=64 \
 -DFUSE_USE_VERSION=26 \
 -D__MULTI_THREAD

LOCAL_SRC_FILES := \
 $(LIB_ROOT_REL)/cuse_lowlevel.c \
 $(LIB_ROOT_REL)/fuse.c \
 $(LIB_ROOT_REL)/fuse_kern_chan.c \
 $(LIB_ROOT_REL)/fuse_loop.c \
 $(LIB_ROOT_REL)/fuse_loop_mt.c \
 $(LIB_ROOT_REL)/fuse_lowlevel.c \
 $(LIB_ROOT_REL)/fuse_mt.c \
 $(LIB_ROOT_REL)/fuse_opt.c \
 $(LIB_ROOT_REL)/fuse_session.c \
 $(LIB_ROOT_REL)/fuse_signals.c \
 $(LIB_ROOT_REL)/helper.c \
 $(LIB_ROOT_REL)/mount.c \
 $(LIB_ROOT_REL)/mount_util.c \
 $(LIB_ROOT_REL)/ulockmgr.c

LOCAL_C_INCLUDES := \
 $(LIB_ROOT_ABS)/ \
 $(LIB_ROOT_ABS)/include
	
LOCAL_MODULE := libfuse

include $(BUILD_STATIC_LIBRARY)


#fusermount

include $(CLEAR_VARS)

LOCAL_CFLAGS := \
 -DANDROID \
 -D_FILE_OFFSET_BITS=64 \
 -DFUSE_USE_VERSION=26 \
 -D__MULTI_THREAD \
 -Wall -DUSE_AUTH \
 -D_XOPEN_SOURCE=500 \
 -D_ISOC99_SOURCE \
 -DIGNORE_MTAB

LOCAL_SRC_FILES := \
 $(LIB_ROOT_REL)/fusermount.c

LOCAL_C_INCLUDES := \
 $(LIB_ROOT_ABS)/ \
 $(LIB_ROOT_ABS)/include

LOCAL_STATIC_LIBRARIES := libfuse

LOCAL_MODULE := fusermount

include $(BUILD_EXECUTABLE)


