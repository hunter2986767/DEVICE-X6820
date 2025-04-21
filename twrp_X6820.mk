#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Omni stuff.
$(call inherit-product, vendor/omni/config/common.mk)

# Inherit from X6820 device
$(call inherit-product, device/infinix/X6820/device.mk)

PRODUCT_DEVICE := X6820
PRODUCT_NAME :=  twrp_X6820
PRODUCT_BRAND := X6820
PRODUCT_MODEL := INFINIX ZERO ULTRA
PRODUCT_MANUFACTURER := infinix

PRODUCT_GMS_CLIENTID_BASE := android-infinix

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="vnd_x6820_h773-user 12 SP1A.210812.016 704578 release-keys"

BUILD_FINGERPRINT := Infinix/X6820-GL/Infinix-X6820:12/SP1A.210812.016/240919V1026:user/release-keys
