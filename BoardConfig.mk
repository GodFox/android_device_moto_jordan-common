# Copyright (C) 2009 The Android Open Source Project
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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).

# Model variant (DEFY_FROYO, DEFY_GINGER, DEFY_PLUS)

BOARD_USES_GENERIC_AUDIO := false

TARGET_NO_RADIOIMAGE := true
TARGET_NO_BOOTLOADER := true
TARGET_NO_PREINSTALL := true
TARGET_BOOTLOADER_BOARD_NAME := jordan
BOARD_HAS_LOCKED_BOOTLOADER  := true

# Board properties
TARGET_BOARD_PLATFORM := omap3
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a8
TARGET_ARCH_VARIANT_FPU := neon
TARGET_GLOBAL_CFLAGS += -mtune=cortex-a8
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a8
TARGET_OMAP3 := true
COMMON_GLOBAL_CFLAGS += -DTARGET_OMAP3 -DOMAP_COMPAT -DMOTOROLA_UIDS -DBINDER_COMPAT
ARCH_ARM_HAVE_TLS_REGISTER := false

# Wifi related defines
BOARD_WLAN_DEVICE           := wl1271
WPA_SUPPLICANT_VERSION      := VER_0_6_X
BOARD_WPA_SUPPLICANT_DRIVER := CUSTOM
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/tiwlan_drv.ko"
WIFI_DRIVER_MODULE_NAME     := tiwlan_drv
WIFI_DRIVER_FW_STA_PATH     := "/system/etc/wifi/fw_wlan1271.bin"
WIFI_FIRMWARE_LOADER        := wlan_loader
PRODUCT_WIRELESS_TOOLS      := true
BOARD_SOFTAP_DEVICE         := wl1271
AP_CONFIG_DRIVER_WILINK     := true
WIFI_DRIVER_FW_AP_PATH      := "/system/etc/wifi/fw_tiwlan_ap.bin"
WPA_SUPPL_APPROX_USE_RSSI   := true
WPA_SUPPL_WITH_SIGNAL_POLL  := true
# CM9
WIFI_DRIVER_LOADER_DELAY    := 200000
WIFI_AP_DRIVER_MODULE_PATH  := "/system/lib/modules/tiap_drv.ko"
WIFI_AP_DRIVER_MODULE_NAME  := tiap_drv
WIFI_AP_FIRMWARE_LOADER     := wlan_ap_loader
WIFI_AP_DRIVER_MODULE_ARG   := ""
BOARD_HOSTAPD_SERVICE_NAME  := hostap_netd
BOARD_HOSTAPD_NO_ENTROPY    := true
BOARD_HOSTAPD_DRIVER        := true
BOARD_HOSTAPD_DRIVER_NAME   := wilink
BOARD_HOSTAPD_TIAP_ROOT     := system/wlan/ti/WiLink_AP

# Netfilter
#BOARD_WITHOUT_IPV6_QUOTA := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
TARGET_CUSTOM_BLUEDROID := ../../../device/motorola/jordan-common/bluedroid.c

# Usb Specific
BOARD_CUSTOM_USB_CONTROLLER := ../../device/motorola/jordan-common/UsbController.cpp
BOARD_USE_USB_MASS_STORAGE_SWITCH := true
BOARD_MASS_STORAGE_FILE_PATH := "/sys/devices/platform/usb_mass_storage/lun0/file"
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/usb_mass_storage/lun0/file"
BOARD_MTP_DEVICE := "/dev/mtp"
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true

# Build options
BOARD_BOOTIMAGE_MAX_SIZE := $(call image-size-from-data-size,0x00280000)
BOARD_RECOVERYIMAGE_MAX_SIZE := $(call image-size-from-data-size,0x00500000)
BOARD_SYSTEMIMAGE_MAX_SIZE := $(call image-size-from-data-size,0x07500000)
BOARD_USERDATAIMAGE_MAX_SIZE := $(call image-size-from-data-size,0x04ac0000)
BOARD_FLASH_BLOCK_SIZE := 131072

# OMX Stuff
HARDWARE_OMX := true
TARGET_USE_OMX_RECOVERY := true
TARGET_USE_OMAP_COMPAT  := true
BUILD_WITH_TI_AUDIO := 1
BUILD_PV_VIDEO_ENCODERS := 1

# Bootmenu
BOARD_USES_BOOTMENU := true
BOARD_WITH_CPCAP    := true
BOARD_MMC_DEVICE    := /dev/block/mmcblk1
BOARD_BOOTMODE_CONFIG_FILE := /cache/recovery/bootmode.conf
BOARD_BOOTMENU_REBOOT_HOOK := ../../../device/motorola-common/jordan/reboot_hook.c

BOARD_SDCARD_DEVICE_PRIMARY   := /dev/block/mmcblk0p1
BOARD_SDCARD_DEVICE_SECONDARY := /dev/block/mmcblk0
BOARD_SDEXT_DEVICE  := /dev/block/mmcblk0p2
BOARD_SYSTEM_DEVICE := /dev/block/mmcblk1p21
BOARD_DATA_DEVICE   := /dev/block/mmcblk1p25

# Init files
TARGET_PROVIDES_INIT_RC := true
TARGET_PROVIDES_UEVENTD_RC := true
TARGET_PROVIDES_B2G_INIT_RC := true

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
BOARD_RECOVERY_IGNORE_BOOTABLES := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_HAS_SMALL_RECOVERY := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_NEVER_UMOUNT_SYSTEM := true
BOARD_CUSTOM_RECOVERY_KEYMAPPING:= ../../device/motorola/jordan-common/recovery_keys.c
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext3
TARGET_USERIMAGES_USE_EXT4 := false
#TARGET_RECOVERY_UI_LIB := librecovery_ui_generic
#TARGET_RECOVERY_UPDATER_LIBS += librecovery_updater_generic
TARGET_RECOVERY_PRE_COMMAND := "/system/bootmenu/script/reboot_command.sh"
TARGET_RECOVERY_PRE_COMMAND_CLEAR_REASON := true

# FM Radio (not ready in ICS)
# BOARD_HAVE_FM_RADIO := true
# BOARD_FM_DEVICE := wl1271
# COMMON_GLOBAL_CFLAGS += -DHAVE_FM_RADIO

# Egl Specific
USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := device/motorola/jordan-common/egl.cfg
BOARD_NO_ALLOW_DEQUEUE_CURRENT_BUFFER := true
DEFAULT_FB_NUM := 0
BOARD_USE_YUV422I_DEFAULT_COLORFORMAT := true
BOARD_USES_OVERLAY := true
ENABLE_WEBGL := true
# Camera
USE_CAMERA_STUB := false
BOARD_OVERLAY_BASED_CAMERA_HAL := true

# Other..
BOARD_USE_LEGACY_TOUCHSCREEN := true
ENABLE_SENSORS_COMPAT := true
TARGET_PROXIMITY_SENSOR_LIMIT := 0x1F
BOARD_USES_AUDIO_LEGACY := true
TARGET_PROVIDES_LIBAUDIO := true
BOARD_USE_KINETO_COMPATIBILITY := true
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true

# If kernel sources are present in repo, here is the location
#TARGET_KERNEL_SOURCE := $(ANDROID_BUILD_TOP)/kernel-omap
#TARGET_KERNEL_CONFIG   := mapphone_mb525_defconfig
#TARGET_PREBUILT_KERNEL := $(ANDROID_BUILD_TOP)/device/motorola/jordan-common/kernel
# Extra : external modules sources
#TARGET_KERNEL_MODULES_EXT := $(ANDROID_BUILD_TOP)/device/motorola/jordan-common/modules


##### 2ndboot Kernel stuff #####

BUILD_2NDBOOT_KERNEL := true

ifeq ($(BUILD_2NDBOOT_KERNEL),true)

MODULES_2NDBOOT_NAME := true
TARGET_MODULES_WIFI_SOURCE := "system/wlan/ti/wilink_6_1/platforms/os/linux/"
TARGET_MODULES_AP_SOURCE := "system/wlan/ti/WiLink_AP/platforms/os/linux/"

API_MAKE := \
	make PREFIX=$(ANDROID_BUILD_TOP)/$(TARGET_OUT_INTERMEDIATES)/kernel_intermediates/build \
	ARCH=arm \
	CROSS_COMPILE=$(ANDROID_BUILD_TOP)/prebuilt/$(HOST_PREBUILT_TAG)/toolchain/arm-eabi-4.4.3/bin/arm-eabi- \
	HOST_PLATFORM=zoom2 \
	KERNEL_DIR=$(ANDROID_BUILD_TOP)/$(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ \

ext_modules:
	$(API_MAKE) -C $(TARGET_KERNEL_MODULES_EXT) modules
	find $(TARGET_KERNEL_MODULES_EXT)/ -name "*.ko" -exec mv {} \
		$(KERNEL_MODULES_2NDBOOT_OUT)/ \; || true
	$(API_MAKE) clean -C $(TARGET_MODULES_WIFI_SOURCE)
	$(API_MAKE) clean -C $(TARGET_MODULES_AP_SOURCE)
	$(API_MAKE) -C $(TARGET_MODULES_WIFI_SOURCE) HOST_PLATFORM=zoom2 KERNEL_DIR=$(KERNEL_OUT)
	$(API_MAKE) -C $(TARGET_MODULES_AP_SOURCE) HOST_PLATFORM=zoom2 KERNEL_DIR=$(KERNEL_OUT)
	mv $(TARGET_MODULES_WIFI_SOURCE)/tiwlan_drv.ko $(KERNEL_MODULES_2NDBOOT_OUT)/tiwlan_drv.ko
	mv $(TARGET_MODULES_AP_SOURCE)/tiap_drv.ko $(KERNEL_MODULES_2NDBOOT_OUT)/tiap_drv.ko
	$(ANDROID_BUILD_TOP)/device/motorola/jordan-common/modules-2ndboot.sh
	arm-linux-androideabi-strip --strip-unneeded $(KERNEL_MODULES_OUT)/*.ko

hboot:
	mkdir -p $(PRODUCT_OUT)/system/bootmenu/2nd-boot
	echo "$(BOARD_KERNEL_CMDLINE)" > $(PRODUCT_OUT)/system/bootmenu/2nd-boot/cmdline
	echo "$(BOARD_KERNEL_CMDLINE_UART)" > $(PRODUCT_OUT)/system/bootmenu/2nd-boot/cmdline-uart
	$(API_MAKE) -C $(ANDROID_BUILD_TOP)/device/motorola/jordan-common/hboot
	mv $(ANDROID_BUILD_TOP)/device/motorola/jordan-common/hboot/hboot.bin $(PRODUCT_OUT)/system/bootmenu/2nd-boot/
	make clean -C $(ANDROID_BUILD_TOP)/device/motorola/jordan-common/hboot

# If kernel sources are present in repo, here is the location
TARGET_KERNEL_SOURCE := $(ANDROID_BUILD_TOP)/kernel/moto/jordan
TARGET_KERNEL_CUSTOM_TOOLCHAIN := arm-eabi-4.4.3
TARGET_KERNEL_CONFIG  := mapphone_defconfig
BOARD_KERNEL_CMDLINE := console=/dev/null mem=498M init=/init ip=off brdrev=P3A vram=6M omapfb.vram=0:6M
BOARD_KERNEL_CMDLINE_UART := console=ttyS2,115200 mem=498M init=/init ip=off brdrev=P3A vram=6M omapfb.vram=0:6M
#TARGET_PREBUILT_KERNEL := $(ANDROID_BUILD_TOP)/device/motorola/jordan-common/kernel
# Extra : external modules sources
TARGET_KERNEL_MODULES_EXT := $(ANDROID_BUILD_TOP)/device/motorola/jordan-common/modules/sources
TARGET_KERNEL_MODULES := ext_modules hboot

else

# copy all 2ndboot kernel modules under the "modules-2ndboot" directory to system/lib/modules

PRODUCT_COPY_FILES += $(shell test -d device/motorola/jordan-common/modules-2ndboot && \
	find device/motorola/jordan-common/modules-2ndboot -name '*.ko' \
	-printf '%p:system/lib/modules/%f ')

PRODUCT_COPY_FILES += \
	device/motorola/jordan-common/profiles/2nd-boot/cmdline:system/bootmenu/2nd-boot/cmdline \
	device/motorola/jordan-common/profiles/2nd-boot/cmdline-uart:system/bootmenu/2nd-boot/cmdline-uart \
	device/motorola/jordan-common/profiles/2nd-boot/hboot.bin:system/bootmenu/2nd-boot/hboot.bin
endif