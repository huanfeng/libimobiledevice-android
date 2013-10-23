#libxml2

LIB_ICONV_VERSION:=libiconv-android/libiconv

LIB_VERSION:=libxml2-android/libxml2

LOCAL_PATH:= $(call my-dir)
LIB_ROOT_REL:= ../../$(LIB_VERSION)
LIB_ROOT_ABS:= $(LOCAL_PATH)/../../$(LIB_VERSION)

include $(CLEAR_VARS)

LOCAL_CFLAGS := \
 -DHAVA_CONFIG_H

LOCAL_SRC_FILES := \
 $(LIB_ROOT_REL)/c14n.c \
 $(LIB_ROOT_REL)/catalog.c \
 $(LIB_ROOT_REL)/chvalid.c \
 $(LIB_ROOT_REL)/debugXML.c \
 $(LIB_ROOT_REL)/dict.c \
 $(LIB_ROOT_REL)/DOCBparser.c \
 $(LIB_ROOT_REL)/encoding.c \
 $(LIB_ROOT_REL)/entities.c \
 $(LIB_ROOT_REL)/error.c \
 $(LIB_ROOT_REL)/globals.c \
 $(LIB_ROOT_REL)/hash.c \
 $(LIB_ROOT_REL)/HTMLparser.c \
 $(LIB_ROOT_REL)/HTMLtree.c \
 $(LIB_ROOT_REL)/legacy.c \
 $(LIB_ROOT_REL)/list.c \
 $(LIB_ROOT_REL)/nanoftp.c \
 $(LIB_ROOT_REL)/nanohttp.c \
 $(LIB_ROOT_REL)/parser.c \
 $(LIB_ROOT_REL)/parserInternals.c \
 $(LIB_ROOT_REL)/pattern.c \
 $(LIB_ROOT_REL)/relaxng.c \
 $(LIB_ROOT_REL)/SAX.c \
 $(LIB_ROOT_REL)/SAX2.c \
 $(LIB_ROOT_REL)/threads.c \
 $(LIB_ROOT_REL)/tree.c \
 $(LIB_ROOT_REL)/trionan.c \
 $(LIB_ROOT_REL)/triostr.c \
 $(LIB_ROOT_REL)/uri.c \
 $(LIB_ROOT_REL)/valid.c\
 $(LIB_ROOT_REL)/xinclude.c \
 $(LIB_ROOT_REL)/xlink.c \
 $(LIB_ROOT_REL)/xmlIO.c \
 $(LIB_ROOT_REL)/xmlmemory.c \
 $(LIB_ROOT_REL)/xmlmodule.c \
 $(LIB_ROOT_REL)/xmlreader.c \
 $(LIB_ROOT_REL)/xmlregexp.c \
 $(LIB_ROOT_REL)/xmlsave.c \
 $(LIB_ROOT_REL)/xmlschemas.c \
 $(LIB_ROOT_REL)/xmlschemastypes.c \
 $(LIB_ROOT_REL)/xmlstring.c \
 $(LIB_ROOT_REL)/xmlunicode.c \
 $(LIB_ROOT_REL)/xmlwriter.c \
 $(LIB_ROOT_REL)/xpath.c \
 $(LIB_ROOT_REL)/xpointer.c

LOCAL_C_INCLUDES := \
 $(LIB_ROOT_ABS)/ \
 $(LIB_ROOT_ABS)/include \
 $(LIB_ROOT_ABS)/../../$(LIB_ICONV_VERSION) \
 $(LIB_ROOT_ABS)/../../$(LIB_ICONV_VERSION)/include \
 $(LIB_ROOT_ABS)/../../$(LIB_ICONV_VERSION)/lib \
 $(LIB_ROOT_ABS)/../../$(LIB_ICONV_VERSION)/libcharset \
 $(LIB_ROOT_ABS)/../../$(LIB_ICONV_VERSION)/libcharset/include
  
LOCAL_LDLIBS := \
 -lz

LOCAL_SHARED_LIBRARIES := libiconv

LOCAL_MODULE := libxml2

include $(BUILD_SHARED_LIBRARY)


