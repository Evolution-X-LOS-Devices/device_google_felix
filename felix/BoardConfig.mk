#
# Copyright (C) 2020 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
TARGET_BOARD_INFO_FILE := device/google/felix/board-info.txt
TARGET_BOOTLOADER_BOARD_NAME := felix
TARGET_SCREEN_DENSITY := 420
BOARD_USES_GENERIC_AUDIO := true
USES_DEVICE_GOOGLE_FELIX := true
BOARD_KERNEL_CMDLINE += swiotlb=noforce

RELEASE_GOOGLE_PRODUCT_RADIO_DIR := $(RELEASE_GOOGLE_FELIX_RADIO_DIR)
RELEASE_GOOGLE_BOOTLOADER_FELIX_DIR ?= pdk# Keep this for pdk TODO: b/327119000
RELEASE_GOOGLE_PRODUCT_BOOTLOADER_DIR := bootloader/$(RELEASE_GOOGLE_BOOTLOADER_FELIX_DIR)
$(call soong_config_set,felix_bootloader,prebuilt_dir,$(RELEASE_GOOGLE_BOOTLOADER_FELIX_DIR))

# Enable load module in parallel
BOARD_BOOTCONFIG += androidboot.load_modules_parallel=true

# The modules which need to be loaded in sequential
BOARD_KERNEL_CMDLINE += fips140.load_sequential=1
BOARD_KERNEL_CMDLINE += exynos_drm.load_sequential=1
BOARD_KERNEL_CMDLINE += panel-samsung-ana6707-f10.load_sequential=1
BOARD_KERNEL_CMDLINE += s2mpg12-regulator.load_sequential=1

#Display
USES_IDISPLAY_INTF_SEC := true

include device/google/gs201/BoardConfig-common.mk
-include vendor/google_devices/gs201/prebuilts/BoardConfigVendor.mk
include device/google/gs-common/check_current_prebuilt/check_current_prebuilt.mk
-include vendor/google_devices/felix/proprietary/BoardConfigVendor.mk
include device/google/felix/sepolicy/felix-sepolicy.mk
include device/google/felix/wifi/BoardConfig-wifi.mk

DEVICE_PATH := device/google/felix
VENDOR_PATH := vendor/google/felix
include $(DEVICE_PATH)/$(TARGET_BOOTLOADER_BOARD_NAME)/BoardConfigLineage.mk
include $(DEVICE_PATH)/$(TARGET_BOOTLOADER_BOARD_NAME)/BoardConfigEvolution.mk
