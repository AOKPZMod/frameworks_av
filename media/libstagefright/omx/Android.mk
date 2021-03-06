LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES:=                     \
        OMX.cpp                       \
        OMXMaster.cpp                 \
        OMXNodeInstance.cpp           \
        SimpleSoftOMXComponent.cpp    \
        SoftOMXComponent.cpp          \
        SoftOMXPlugin.cpp             \

LOCAL_C_INCLUDES += \
        $(TOP)/frameworks/av/media/libstagefright \
        $(TOP)/frameworks/native/include/media/hardware \
        $(TOP)/frameworks/native/include/media/openmax

LOCAL_SHARED_LIBRARIES :=               \
        libbinder                       \
        libmedia                        \
        libutils                        \
        libui                           \
        libcutils                       \
        libstagefright_foundation       \
        libdl

ifeq ($(BOARD_USES_PROPRIETARY_OMX),SAMSUNG)
LOCAL_CFLAGS     += -DSAMSUNG_OMX
endif

ifeq ($(BOARD_USE_OLD_AVC_ENCODER),true)
LOCAL_CFLAGS += -DOLD_AVC_ENCODER
endif

ifeq ($(BOARD_USES_PROPRIETARY_OMX),SAMSUNG)
LOCAL_CFLAGS     += -DSAMSUNG_OMX
endif

LOCAL_MODULE:= libstagefright_omx

include $(BUILD_SHARED_LIBRARY)

################################################################################

include $(call all-makefiles-under,$(LOCAL_PATH))
