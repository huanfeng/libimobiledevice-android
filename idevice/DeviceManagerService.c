#include <jni.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "DeviceManagerService.h"
#include <libimobiledevice/libimobiledevice.h>
#include <libimobiledevice/lockdown.h>
#include <plist/plist.h>


static idevice_t device = NULL;

void throwException(JNIEnv *env, const char *format, ...){
    va_list args;
    char *msg = NULL;

    va_start(args, format);
    (void)vasprintf(&msg, format, args);
    (*env)->ThrowNew(env, (*env)->FindClass(env, "com/xxdroid/idevice/Exception"), msg);
    va_end(args);
}


JNIEXPORT jobject JNICALL Java_com_xxdroid_idevice_DeviceManagerService_getDeviceListNative  (JNIEnv *env, jobject thiz) {
    int i = 0;
    char **dev_list = NULL;
    if (idevice_get_device_list(&dev_list, &i) < 0) {
        throwException(env,"ERROR: Unable to retrieve device list!");
    }

    jobjectArray ret;
    ret= (jobjectArray) (*env)->NewObjectArray(env, i, (*env)->FindClass(env,"java/lang/String"),(*env)->NewStringUTF(env,""));



    for (i = 0; dev_list[i] != NULL; i++) {
        (*env)->SetObjectArrayElement(env,ret,i,(*env)->NewStringUTF(env,dev_list[i]));
    }

    idevice_device_list_free(dev_list);

    return(ret);
}




JNIEXPORT jstring JNICALL Java_com_xxdroid_idevice_DeviceManagerService_getDeviceInfoNative(JNIEnv *env , jobject thiz, jstring uuid){
    char *deviceid = NULL;
    jboolean *isCopy = NULL;
    idevice_error_t ret = IDEVICE_E_UNKNOWN_ERROR;
    idevice_t device = NULL;
    lockdownd_client_t client = NULL;
    char *domain = NULL;
    char *key = NULL;
    plist_t node = NULL;
    char *xml_doc = NULL;
    uint32_t xml_length = 0;
    jstring res = NULL;



    deviceid = (char*)(*env)->GetStringUTFChars(env,uuid,isCopy);
    //printf("recieved request for device info for device : %s\n",deviceid);

    ret = idevice_new(&device, deviceid);

    if (ret != IDEVICE_E_SUCCESS) {
        if (deviceid!=NULL) {
            throwException(env,"No device found with given uuid, is it plugged in?\n");
    	    //printf("No device found with udid %s, is it plugged in?\n", deviceid);
    	    return ;
    	} else {
    		throwException(env,"No device found, is it plugged in?\n");
    		//printf("No device found, is it plugged in?\n");
    		return ;
    	}
    }

    // do we need the handshake here ?
    if (LOCKDOWN_E_SUCCESS != lockdownd_client_new_with_handshake(device, &client, "java")) {
    	idevice_free(device);
    	throwException(env,"Found device, but cannot do lockdown.\n");
    }

    if(lockdownd_get_value(client, domain, key, &node) == LOCKDOWN_E_SUCCESS) {
        if (node) {
            plist_to_xml(node, &xml_doc, &xml_length);
            //printf("FROM C \n\n%s\n\n", xml_doc);
            res = (*env)->NewStringUTF(env,xml_doc);
            free(xml_doc);
            plist_free(node);
            node = NULL;
        }else {
            // node
        }
     }else {
        // get info call failed.
     }
    lockdownd_client_free(client);
    idevice_free(device);

    return res;
}
