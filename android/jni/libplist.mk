#libplist
LIB_XML_VERSION:=libxml2-android/libxml2
LIB_ICONV_VERSION:=libiconv-android/libiconv

LIB_VERSION:=libplist

LOCAL_PATH:= $(call my-dir)
LIB_ROOT_REL:= ../../$(LIB_VERSION)
LIB_ROOT_ABS:= $(LOCAL_PATH)/../../$(LIB_VERSION)

#libcnary

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
 $(LIB_ROOT_REL)/libcnary/iterator.c \
 $(LIB_ROOT_REL)/libcnary/list.c \
 $(LIB_ROOT_REL)/libcnary/node.c \
 $(LIB_ROOT_REL)/libcnary/node_iterator.c \
 $(LIB_ROOT_REL)/libcnary/node_list.c \
 $(LIB_ROOT_REL)/libcnary/cnary.c

LOCAL_C_INCLUDES += \
 $(LIB_ROOT_ABS)/libcnary \
 $(LIB_ROOT_ABS)/libcnary/include \

LOCAL_MODULE := libcnary

include $(BUILD_STATIC_LIBRARY)


#libplist

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
 $(LIB_ROOT_REL)/src/plist.c \
 $(LIB_ROOT_REL)/src/hashtable.c \
 $(LIB_ROOT_REL)/src/bytearray.c \
 $(LIB_ROOT_REL)/src/ptrarray.c \
 $(LIB_ROOT_REL)/src/bplist.c \
 $(LIB_ROOT_REL)/src/base64.c \
 $(LIB_ROOT_REL)/src/xplist.c

LOCAL_C_INCLUDES := \
 $(LIB_ROOT_ABS)/src \
 $(LIB_ROOT_ABS)/include \
 $(LIB_ROOT_ABS)/libcnary/include \
 $(LIB_ROOT_ABS)/../$(LIB_XML_VERSION) \
 $(LIB_ROOT_ABS)/../$(LIB_XML_VERSION)/include \
 $(LIB_ROOT_ABS)/../$(LIB_ICONV_VERSION) \
 $(LIB_ROOT_ABS)/../$(LIB_ICONV_VERSION)/include \
 $(LIB_ROOT_ABS)/../$(LIB_ICONV_VERSION)/lib \
 $(LIB_ROOT_ABS)/../$(LIB_ICONV_VERSION)/libcharset \
 $(LIB_ROOT_ABS)/../$(LIB_ICONV_VERSION)/libcharset/include

LOCAL_STATIC_LIBRARIES := libcnary
LOCAL_SHARED_LIBRARIES := libiconv libxml2

LOCAL_MODULE := libplist

include $(BUILD_SHARED_LIBRARY)


#libplist++

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
 $(LIB_ROOT_REL)/src/Node.cpp \
 $(LIB_ROOT_REL)/src/Boolean.cpp \
 $(LIB_ROOT_REL)/src/Integer.cpp \
 $(LIB_ROOT_REL)/src/Real.cpp \
 $(LIB_ROOT_REL)/src/String.cpp \
 $(LIB_ROOT_REL)/src/Date.cpp \
 $(LIB_ROOT_REL)/src/Data.cpp \
 $(LIB_ROOT_REL)/src/Key.cpp \
 $(LIB_ROOT_REL)/src/Uid.cpp \
 $(LIB_ROOT_REL)/src/Structure.cpp \
 $(LIB_ROOT_REL)/src/Array.cpp \
 $(LIB_ROOT_REL)/src/Dictionary.cpp

LOCAL_C_INCLUDES := \
 $(LIB_ROOT_ABS)/src \
 $(LIB_ROOT_ABS)/include \
 $(LIB_ROOT_ABS)/libcnary/include \
 $(LIB_ROOT_ABS)/../$(LIB_XML_VERSION) \
 $(LIB_ROOT_ABS)/../$(LIB_XML_VERSION)/include \
 $(LIB_ROOT_ABS)/../$(LIB_ICONV_VERSION) \
 $(LIB_ROOT_ABS)/../$(LIB_ICONV_VERSION)/include \
 $(LIB_ROOT_ABS)/../$(LIB_ICONV_VERSION)/lib \
 $(LIB_ROOT_ABS)/../$(LIB_ICONV_VERSION)/libcharset \
 $(LIB_ROOT_ABS)/../$(LIB_ICONV_VERSION)/libcharset/include

LOCAL_STATIC_LIBRARIES := libcnary
LOCAL_SHARED_LIBRARIES := libiconv libxml2 libplist

LOCAL_MODULE := libplist++

include $(BUILD_SHARED_LIBRARY)


#plistutil

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
 $(LIB_ROOT_REL)/plistutil/plistutil.c

LOCAL_C_INCLUDES := \
 $(LIB_ROOT_ABS)/plistutil \
 $(LIB_ROOT_ABS)/src \
 $(LIB_ROOT_ABS)/include \
 $(LIB_ROOT_ABS)/include \
 $(LIB_ROOT_ABS)/libcnary/include \
 $(LIB_ROOT_ABS)/../$(LIB_XML_VERSION) \
 $(LIB_ROOT_ABS)/../$(LIB_XML_VERSION)/include \
 $(LIB_ROOT_ABS)/../$(LIB_ICONV_VERSION) \
 $(LIB_ROOT_ABS)/../$(LIB_ICONV_VERSION)/include \
 $(LIB_ROOT_ABS)/../$(LIB_ICONV_VERSION)/lib \
 $(LIB_ROOT_ABS)/../$(LIB_ICONV_VERSION)/libcharset \
 $(LIB_ROOT_ABS)/../$(LIB_ICONV_VERSION)/libcharset/include

LOCAL_STATIC_LIBRARIES := libcnary
LOCAL_SHARED_LIBRARIES := libiconv libxml2 libplist

LOCAL_MODULE := plistutil

include $(BUILD_EXECUTABLE)