#
# SPDX-FileCopyrightText: 2021-2024 The LineageOS Project
# SPDX-FileCopyrightText: 2021-2024 The Calyx Institute
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PACKAGE_OVERLAYS += $(DEVICE_PATH)/overlay-lineage

# ANGLE - Almost Native Graphics Layer Engine
PRODUCT_PACKAGES += \
    ANGLE

# EUICC
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.euicc.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/android.hardware.telephony.euicc.xml

PRODUCT_PACKAGES += \
    EuiccSupportPixelOverlay

# Fold extensions
PRODUCT_SYSTEM_SERVER_JARS += \
    system_ext:felix-services

# HBM
PRODUCT_PACKAGES += \
    HbmSVManagerOverlayFelix

# IWLAN
PRODUCT_PACKAGES += \
    Iwlan

# wireless_charger HAL service
include device/google/gs-common/wireless_charger/wireless_charger.mk

# Build necessary packages for vendor

# Codec2
PRODUCT_PACKAGES += \
    libacryl \
    libacryl_hdr_plugin \
    libexynosv4l2

# Graphics
PRODUCT_PACKAGES += \
    libEGL_angle \
    libGLESv1_CM_angle \
    libGLESv2_angle

# Sensors
PRODUCT_PACKAGES += \
    sensors.dynamic_sensor_hal
