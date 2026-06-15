################################################################################
# MRS Version: 2.3.0
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../.doc/DOC/EXAM/USB/USBHS/HOST_KM/User/USB_Host/app_km.c \
../.doc/DOC/EXAM/USB/USBHS/HOST_KM/User/USB_Host/ch32v30x_usbfs_host.c \
../.doc/DOC/EXAM/USB/USBHS/HOST_KM/User/USB_Host/ch32v30x_usbhs_host.c \
../.doc/DOC/EXAM/USB/USBHS/HOST_KM/User/USB_Host/usb_host_hid.c \
../.doc/DOC/EXAM/USB/USBHS/HOST_KM/User/USB_Host/usb_host_hub.c 

C_DEPS += \
./.doc/DOC/EXAM/USB/USBHS/HOST_KM/User/USB_Host/app_km.d \
./.doc/DOC/EXAM/USB/USBHS/HOST_KM/User/USB_Host/ch32v30x_usbfs_host.d \
./.doc/DOC/EXAM/USB/USBHS/HOST_KM/User/USB_Host/ch32v30x_usbhs_host.d \
./.doc/DOC/EXAM/USB/USBHS/HOST_KM/User/USB_Host/usb_host_hid.d \
./.doc/DOC/EXAM/USB/USBHS/HOST_KM/User/USB_Host/usb_host_hub.d 

OBJS += \
./.doc/DOC/EXAM/USB/USBHS/HOST_KM/User/USB_Host/app_km.o \
./.doc/DOC/EXAM/USB/USBHS/HOST_KM/User/USB_Host/ch32v30x_usbfs_host.o \
./.doc/DOC/EXAM/USB/USBHS/HOST_KM/User/USB_Host/ch32v30x_usbhs_host.o \
./.doc/DOC/EXAM/USB/USBHS/HOST_KM/User/USB_Host/usb_host_hid.o \
./.doc/DOC/EXAM/USB/USBHS/HOST_KM/User/USB_Host/usb_host_hub.o 

DIR_OBJS += \
./.doc/DOC/EXAM/USB/USBHS/HOST_KM/User/USB_Host/*.o \

DIR_DEPS += \
./.doc/DOC/EXAM/USB/USBHS/HOST_KM/User/USB_Host/*.d \

DIR_EXPANDS += \
./.doc/DOC/EXAM/USB/USBHS/HOST_KM/User/USB_Host/*.253r.expand \


# Each subdirectory must supply rules for building sources it contributes
.doc/DOC/EXAM/USB/USBHS/HOST_KM/User/USB_Host/%.o: ../.doc/DOC/EXAM/USB/USBHS/HOST_KM/User/USB_Host/%.c
	@	riscv-wch-elf-gcc -march=rv32imafcxw -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -fsingle-precision-constant -Wunused -Wuninitialized -g -I"/home/alarm/mounriver-studio-projects/testCH32V305/Debug" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Core" -I"/home/alarm/mounriver-studio-projects/testCH32V305/User" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Peripheral/inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"

