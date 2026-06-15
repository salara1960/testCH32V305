################################################################################
# MRS Version: 2.3.0
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../.doc/DOC/EXAM/USB/USBFS/DEVICE/SimulateCDC-HID/User/USB_Device/ch32v30x_usbfs_device.c \
../.doc/DOC/EXAM/USB/USBFS/DEVICE/SimulateCDC-HID/User/USB_Device/usb_desc.c 

C_DEPS += \
./.doc/DOC/EXAM/USB/USBFS/DEVICE/SimulateCDC-HID/User/USB_Device/ch32v30x_usbfs_device.d \
./.doc/DOC/EXAM/USB/USBFS/DEVICE/SimulateCDC-HID/User/USB_Device/usb_desc.d 

OBJS += \
./.doc/DOC/EXAM/USB/USBFS/DEVICE/SimulateCDC-HID/User/USB_Device/ch32v30x_usbfs_device.o \
./.doc/DOC/EXAM/USB/USBFS/DEVICE/SimulateCDC-HID/User/USB_Device/usb_desc.o 

DIR_OBJS += \
./.doc/DOC/EXAM/USB/USBFS/DEVICE/SimulateCDC-HID/User/USB_Device/*.o \

DIR_DEPS += \
./.doc/DOC/EXAM/USB/USBFS/DEVICE/SimulateCDC-HID/User/USB_Device/*.d \

DIR_EXPANDS += \
./.doc/DOC/EXAM/USB/USBFS/DEVICE/SimulateCDC-HID/User/USB_Device/*.253r.expand \


# Each subdirectory must supply rules for building sources it contributes
.doc/DOC/EXAM/USB/USBFS/DEVICE/SimulateCDC-HID/User/USB_Device/%.o: ../.doc/DOC/EXAM/USB/USBFS/DEVICE/SimulateCDC-HID/User/USB_Device/%.c
	@	riscv-wch-elf-gcc -march=rv32imafcxw -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -fsingle-precision-constant -Wunused -Wuninitialized -g -I"/home/alarm/mounriver-studio-projects/testCH32V305/Debug" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Core" -I"/home/alarm/mounriver-studio-projects/testCH32V305/User" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Peripheral/inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"

