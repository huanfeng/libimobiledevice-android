#libfuse

LIB_VERSION:=libfuse-android

LOCAL_PATH:= $(call my-dir)
LIB_ROOT_REL:= ../../$(LIB_VERSION)
LIB_ROOT_ABS:= $(LOCAL_PATH)/../../$(LIB_VERSION)

include $(CLEAR_VARS)

LOCAL_CFLAGS := \
 -D__ANDROID__ \
 -DHAVE_CONFIG_H \
 -D_FILE_OFFSET_BITS=64 \
 -DFUSE_USE_VERSION=26 \
 -D__MULTI_THREAD

LOCAL_SRC_FILES := \
 $(LIB_ROOT_REL)/lib/cuse_lowlevel.c \
 $(LIB_ROOT_REL)/lib/fuse.c \
 $(LIB_ROOT_REL)/lib/fuse_kern_chan.c \
 $(LIB_ROOT_REL)/lib/fuse_loop.c \
 $(LIB_ROOT_REL)/lib/fuse_loop_mt.c \
 $(LIB_ROOT_REL)/lib/fuse_lowlevel.c \
 $(LIB_ROOT_REL)/lib/fuse_mt.c \
 $(LIB_ROOT_REL)/lib/fuse_opt.c \
 $(LIB_ROOT_REL)/lib/fuse_session.c \
 $(LIB_ROOT_REL)/lib/fuse_signals.c \
 $(LIB_ROOT_REL)/lib/helper.c \
 $(LIB_ROOT_REL)/lib/mount.c \
 $(LIB_ROOT_REL)/lib/mount_util.c \
 $(LIB_ROOT_REL)/lib/ulockmgr.c \
 $(LIB_ROOT_REL)/lib/modules/subdir.c

LOCAL_C_INCLUDES := \
 $(LIB_ROOT_ABS)/lib \
 $(LIB_ROOT_ABS)/include
	
LOCAL_MODULE := libfuse

include $(BUILD_STATIC_LIBRARY)

#sub_dir

include $(CLEAR_VARS)

LOCAL_CFLAGS := \
 -D__ANDROID__ \
 -DHAVE_CONFIG_H \
 -D_FILE_OFFSET_BITS=64 \
 -DFUSE_USE_VERSION=26 \
 -D__MULTI_THREAD

LOCAL_SRC_FILES := \
 $(LIB_ROOT_REL)/lib/modules/subdir.c \

LOCAL_C_INCLUDES := \
 $(LIB_ROOT_ABS)/lib \
 $(LIB_ROOT_ABS)/include

LOCAL_STATIC_LIBRARIES := libfuse

LOCAL_MODULE := libfusemod_subdir

include $(BUILD_SHARED_LIBRARY)


#fusermount

include $(CLEAR_VARS)

LOCAL_CFLAGS := \
 -D__ANDROID__ \
 -D_FILE_OFFSET_BITS=64 \
 -DFUSE_USE_VERSION=26 \
 -D__MULTI_THREAD \
 -Wall -DUSE_AUTH \
 -D_XOPEN_SOURCE=500 \
 -D_ISOC99_SOURCE \
 -DIGNORE_MTAB

LOCAL_SRC_FILES := \
 $(LIB_ROOT_REL)/util/fusermount.c

LOCAL_C_INCLUDES := \
 $(LIB_ROOT_ABS)/lib \
 $(LIB_ROOT_ABS)/include

LOCAL_STATIC_LIBRARIES := libfuse

LOCAL_MODULE := fusermount

include $(BUILD_EXECUTABLE)


