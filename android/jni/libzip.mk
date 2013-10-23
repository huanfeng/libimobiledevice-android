#libzip

LIB_VERSION:=libzip-android/libzip

LOCAL_PATH:= $(call my-dir)
LIB_ROOT_REL:= ../../$(LIB_VERSION)
LIB_ROOT_ABS:= $(LOCAL_PATH)/../../$(LIB_VERSION)

include $(CLEAR_VARS)

LOCAL_CFLAGS := -DHAVA_CONFIG_H

LOCAL_SRC_FILES := \
 $(LIB_ROOT_REL)/zip_add.c \
 $(LIB_ROOT_REL)/zip_add_dir.c \
 $(LIB_ROOT_REL)/zip_close.c \
 $(LIB_ROOT_REL)/zip_delete.c \
 $(LIB_ROOT_REL)/zip_dirent.c \
 $(LIB_ROOT_REL)/zip_entry_free.c \
 $(LIB_ROOT_REL)/zip_entry_new.c \
 $(LIB_ROOT_REL)/zip_err_str.c \
 $(LIB_ROOT_REL)/zip_error.c \
 $(LIB_ROOT_REL)/zip_error_clear.c \
 $(LIB_ROOT_REL)/zip_error_get.c \
 $(LIB_ROOT_REL)/zip_error_get_sys_type.c \
 $(LIB_ROOT_REL)/zip_error_strerror.c \
 $(LIB_ROOT_REL)/zip_error_to_str.c \
 $(LIB_ROOT_REL)/zip_fclose.c \
 $(LIB_ROOT_REL)/zip_fdopen.c \
 $(LIB_ROOT_REL)/zip_file_error_clear.c \
 $(LIB_ROOT_REL)/zip_file_error_get.c \
 $(LIB_ROOT_REL)/zip_file_get_offset.c \
 $(LIB_ROOT_REL)/zip_file_strerror.c \
 $(LIB_ROOT_REL)/zip_filerange_crc.c \
 $(LIB_ROOT_REL)/zip_fopen.c \
 $(LIB_ROOT_REL)/zip_fopen_encrypted.c \
 $(LIB_ROOT_REL)/zip_fopen_index.c \
 $(LIB_ROOT_REL)/zip_fopen_index_encrypted.c \
 $(LIB_ROOT_REL)/zip_fread.c \
 $(LIB_ROOT_REL)/zip_free.c \
 $(LIB_ROOT_REL)/zip_get_archive_comment.c \
 $(LIB_ROOT_REL)/zip_get_archive_flag.c \
 $(LIB_ROOT_REL)/zip_get_compression_implementation.c \
 $(LIB_ROOT_REL)/zip_get_encryption_implementation.c \
 $(LIB_ROOT_REL)/zip_get_file_comment.c \
 $(LIB_ROOT_REL)/zip_get_file_extra.c \
 $(LIB_ROOT_REL)/zip_get_name.c \
 $(LIB_ROOT_REL)/zip_get_num_entries.c \
 $(LIB_ROOT_REL)/zip_get_num_files.c \
 $(LIB_ROOT_REL)/zip_memdup.c \
 $(LIB_ROOT_REL)/zip_name_locate.c \
 $(LIB_ROOT_REL)/zip_new.c \
 $(LIB_ROOT_REL)/zip_open.c \
 $(LIB_ROOT_REL)/zip_rename.c \
 $(LIB_ROOT_REL)/zip_replace.c \
 $(LIB_ROOT_REL)/zip_set_archive_comment.c \
 $(LIB_ROOT_REL)/zip_set_archive_flag.c \
 $(LIB_ROOT_REL)/zip_set_default_password.c \
 $(LIB_ROOT_REL)/zip_set_file_comment.c \
 $(LIB_ROOT_REL)/zip_set_file_extra.c \
 $(LIB_ROOT_REL)/zip_set_name.c \
 $(LIB_ROOT_REL)/zip_source_buffer.c \
 $(LIB_ROOT_REL)/zip_source_close.c \
 $(LIB_ROOT_REL)/zip_source_crc.c \
 $(LIB_ROOT_REL)/zip_source_deflate.c \
 $(LIB_ROOT_REL)/zip_source_error.c \
 $(LIB_ROOT_REL)/zip_source_file.c \
 $(LIB_ROOT_REL)/zip_source_filep.c \
 $(LIB_ROOT_REL)/zip_source_free.c \
 $(LIB_ROOT_REL)/zip_source_function.c \
 $(LIB_ROOT_REL)/zip_source_layered.c \
 $(LIB_ROOT_REL)/zip_source_open.c \
 $(LIB_ROOT_REL)/zip_source_pkware.c \
 $(LIB_ROOT_REL)/zip_source_pop.c \
 $(LIB_ROOT_REL)/zip_source_read.c \
 $(LIB_ROOT_REL)/zip_source_stat.c \
 $(LIB_ROOT_REL)/zip_source_zip.c \
 $(LIB_ROOT_REL)/zip_stat.c \
 $(LIB_ROOT_REL)/zip_stat_index.c \
 $(LIB_ROOT_REL)/zip_stat_init.c \
 $(LIB_ROOT_REL)/zip_strerror.c \
 $(LIB_ROOT_REL)/zip_unchange.c \
 $(LIB_ROOT_REL)/zip_unchange_all.c \
 $(LIB_ROOT_REL)/zip_unchange_archive.c \
 $(LIB_ROOT_REL)/zip_unchange_data.c

LOCAL_C_INCLUDES += \
 $(LIB_ROOT_ABS)/

LOCAL_LDLIBS := -lz

LOCAL_MODULE := libzip

include $(BUILD_SHARED_LIBRARY)
