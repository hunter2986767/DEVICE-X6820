#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from our custom product configuration
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from X6820C device
$(call inherit-product, device/infinix/X6820/device.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := X6820
PRODUCT_NAME := twrp_X6820
PRODUCT_BRAND := Infinix
PRODUCT_MODEL := Infinix X6820
PRODUCT_MANUFACTURER := Infinix Zero Ultra

PRODUCT_GMS_CLIENTID_BASE := android-transsion
