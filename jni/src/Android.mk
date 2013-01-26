LOCAL_PATH := $(call my-dir)

#
# Include the pre-built game client
#
include $(CLEAR_VARS)

GAME_PATH := ../spearmint
LOCAL_MODULE    := client
LOCAL_SRC_FILES := $(GAME_PATH)/build/release-android-$(TARGET_ARCH_ABI)/libclient.a

include $(PREBUILT_STATIC_LIBRARY)

#
# Add SDL main and link to libraries
#
include $(CLEAR_VARS)

LOCAL_MODULE := main

SDL_PATH := ../SDL
GAME_PATH := ../spearmint

LOCAL_C_INCLUDES := $(LOCAL_PATH)/$(SDL_PATH)/include

LOCAL_SRC_FILES := $(SDL_PATH)/src/main/android/SDL_android_main.cpp

LOCAL_STATIC_LIBRARIES := client
LOCAL_SHARED_LIBRARIES := SDL2

LOCAL_LDLIBS := -lGLESv1_CM -llog -lc -lgcc -ldl -lm

include $(BUILD_SHARED_LIBRARY)
