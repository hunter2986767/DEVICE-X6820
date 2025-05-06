#!/usr/bin/env bash

#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

FDEVICE="X6820"

fox_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep $FDEVICE)
   if [ -n "$chkdev" ]; then
      FOX_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep $FDEVICE)
      [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
   fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
    export ALLOW_MISSING_DEPENDENCIES=true
    export TW_DEFAULT_LANGUAGE="en"
    export LC_ALL="C"

    # A/B and Dynamic Partitions Support
    export FOX_AB_DEVICE=1
    export OF_DYNAMIC_PARTITIONS=true
    export FOX_VIRTUAL_AB_DEVICE=1

    # OTA and Verity Support
    export OF_FIX_OTA_UPDATE_MANUAL_FLASH_ERROR=1
    export OF_DISABLE_FORCED_ENCRYPTION=1
    export OF_DISABLE_DM_VERITY_FORCED_ENCRYPTION=1
 
    # AVB Support
    export OF_PATCH_AVB20=1

    # Magisk Support
    export OF_USE_MAGISKBOOT=1
    export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES=1

    # Screen Height
    export OF_SCREEN_H=2400
    export OF_STATUS_H=80
    export OF_STATUS_INDENT_LEFT=48
    export OF_STATUS_INDENT_RIGHT=48
    export OF_ALLOW_DISABLE_NAVBAR=1
    
    # Maintainer Logo
    export OF_MAINTAINER_AVATAR="$(gettop)/device/infinix/X6861/maintainer_avatar.png"
    cp "${OF_MAINTAINER_AVATAR}" "$(gettop)/bootable/recovery/gui/theme/portrait_hdpi/images/Default/About/maintainer.png"

    # Backup and File System Support
    export OF_QUICK_BACKUP_LIST="/boot;/data;"
    export OF_USE_TAR_BINARY=1
    export OF_USE_SED_BINARY=1
    export OF_USE_XZ_UTILS=1

    # Additional Support 
    export FOX_DELETE_AROMAFM=1
    export FOX_ENABLE_APP_MANAGER=1
    export FOX_EXTREME_SIZE_REDUCTION=1
    export OF_NO_TREBLE_COMPATIBILITY_CHECK=1
    export OF_DONT_PATCH_ENCRYPTED_DEVICE=1
    export OF_USE_GREEN_LED=0
    export OF_ENABLE_LPTOOLS=1
    export OF_SKIP_DECRYPTED_ADOPTED_STORAGE=1
    export OF_SKIP_FBE_DECRYPTION_SDKVERSION=34 # Don't try to decrypt A14(?)
    export OF_ADVANCED_SECURITY=1
    export OF_USE_TWRP_SAR_DETECT=1
    export OF_FLASHLIGHT_ENABLE=1

    #Vendor Partition
    export FOX_RECOVERY_BOOT_PARTITION="/dev/block/by-name/boot"
    export FOX_RECOVERY_SYSTEM_PARTITION="/dev/block/mapper/system"
    export FOX_RECOVERY_VENDOR_PARTITION="/dev/block/mapper/vendor"
   
    # run a process after formatting data to work-around MTP issues
    export OF_RUN_POST_FORMAT_PROCESS=1
    export OF_SKIP_ORANGEFOX_PROCESS=1
    
    # Information
    export OF_MAINTAINER="VALE"
    export FOX_VARIANT="A12+"

    # Log Build Variables
    if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then
        export | grep "FOX" >> "$FOX_BUILD_LOG_FILE"
        export | grep "OF_" >> "$FOX_BUILD_LOG_FILE"
        export | grep "TARGET_" >> "$FOX_BUILD_LOG_FILE"
        export | grep "TW_" >> "$FOX_BUILD_LOG_FILE"
    fi
fi
