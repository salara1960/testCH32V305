################################################################################
# MRS Version: 2.3.0
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../.doc/DOC/EXAM/IAP/USB_UART/CHV30x_IAP/User/ch32v30x_it.c \
../.doc/DOC/EXAM/IAP/USB_UART/CHV30x_IAP/User/ch32v30x_usbhs_device.c \
../.doc/DOC/EXAM/IAP/USB_UART/CHV30x_IAP/User/ch32v30x_usbotg_device.c \
../.doc/DOC/EXAM/IAP/USB_UART/CHV30x_IAP/User/flash.c \
../.doc/DOC/EXAM/IAP/USB_UART/CHV30x_IAP/User/iap.c \
../.doc/DOC/EXAM/IAP/USB_UART/CHV30x_IAP/User/main.c \
../.doc/DOC/EXAM/IAP/USB_UART/CHV30x_IAP/User/system_ch32v30x.c 

C_DEPS += \
./.doc/DOC/EXAM/IAP/USB_UART/CHV30x_IAP/User/ch32v30x_it.d \
./.doc/DOC/EXAM/IAP/USB_UART/CHV30x_IAP/User/ch32v30x_usbhs_device.d \
./.doc/DOC/EXAM/IAP/USB_UART/CHV30x_IAP/User/ch32v30x_usbotg_device.d \
./.doc/DOC/EXAM/IAP/USB_UART/CHV30x_IAP/User/flash.d \
./.doc/DOC/EXAM/IAP/USB_UART/CHV30x_IAP/User/iap.d \
./.doc/DOC/EXAM/IAP/USB_UART/CHV30x_IAP/User/main.d \
./.doc/DOC/EXAM/IAP/USB_UART/CHV30x_IAP/User/system_ch32v30x.d 

OBJS += \
./.doc/DOC/EXAM/IAP/USB_UART/CHV30x_IAP/User/ch32v30x_it.o \
./.doc/DOC/EXAM/IAP/USB_UART/CHV30x_IAP/User/ch32v30x_usbhs_device.o \
./.doc/DOC/EXAM/IAP/USB_UART/CHV30x_IAP/User/ch32v30x_usbotg_device.o \
./.doc/DOC/EXAM/IAP/USB_UART/CHV30x_IAP/User/flash.o \
./.doc/DOC/EXAM/IAP/USB_UART/CHV30x_IAP/User/iap.o \
./.doc/DOC/EXAM/IAP/USB_UART/CHV30x_IAP/User/main.o \
./.doc/DOC/EXAM/IAP/USB_UART/CHV30x_IAP/User/system_ch32v30x.o 

DIR_OBJS += \
./.doc/DOC/EXAM/IAP/USB_UART/CHV30x_IAP/User/*.o \

DIR_DEPS += \
./.doc/DOC/EXAM/IAP/USB_UART/CHV30x_IAP/User/*.d \

DIR_EXPANDS += \
./.doc/DOC/EXAM/IAP/USB_UART/CHV30x_IAP/User/*.253r.expand \


# Each subdirectory must supply rules for building sources it contributes
.doc/DOC/EXAM/IAP/USB_UART/CHV30x_IAP/User/%.o: ../.doc/DOC/EXAM/IAP/USB_UART/CHV30x_IAP/User/%.c
	@	riscv-wch-elf-gcc -march=rv32imafcxw -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -fsingle-precision-constant -Wunused -Wuninitialized -g -I"/home/alarm/mounriver-studio-projects/testCH32V305/Debug" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Core" -I"/home/alarm/mounriver-studio-projects/testCH32V305/User" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Peripheral/inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"

