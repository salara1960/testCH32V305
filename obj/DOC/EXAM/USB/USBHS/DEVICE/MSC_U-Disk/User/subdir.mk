################################################################################
# MRS Version: 2.3.0
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../DOC/EXAM/USB/USBHS/DEVICE/MSC_U-Disk/User/Internal_Flash.c \
../DOC/EXAM/USB/USBHS/DEVICE/MSC_U-Disk/User/SPI_FLASH.c \
../DOC/EXAM/USB/USBHS/DEVICE/MSC_U-Disk/User/SW_UDISK.c \
../DOC/EXAM/USB/USBHS/DEVICE/MSC_U-Disk/User/ch32v30x_it.c \
../DOC/EXAM/USB/USBHS/DEVICE/MSC_U-Disk/User/ch32v30x_usbhs_device.c \
../DOC/EXAM/USB/USBHS/DEVICE/MSC_U-Disk/User/main.c \
../DOC/EXAM/USB/USBHS/DEVICE/MSC_U-Disk/User/system_ch32v30x.c \
../DOC/EXAM/USB/USBHS/DEVICE/MSC_U-Disk/User/usb_desc.c 

C_DEPS += \
./DOC/EXAM/USB/USBHS/DEVICE/MSC_U-Disk/User/Internal_Flash.d \
./DOC/EXAM/USB/USBHS/DEVICE/MSC_U-Disk/User/SPI_FLASH.d \
./DOC/EXAM/USB/USBHS/DEVICE/MSC_U-Disk/User/SW_UDISK.d \
./DOC/EXAM/USB/USBHS/DEVICE/MSC_U-Disk/User/ch32v30x_it.d \
./DOC/EXAM/USB/USBHS/DEVICE/MSC_U-Disk/User/ch32v30x_usbhs_device.d \
./DOC/EXAM/USB/USBHS/DEVICE/MSC_U-Disk/User/main.d \
./DOC/EXAM/USB/USBHS/DEVICE/MSC_U-Disk/User/system_ch32v30x.d \
./DOC/EXAM/USB/USBHS/DEVICE/MSC_U-Disk/User/usb_desc.d 

OBJS += \
./DOC/EXAM/USB/USBHS/DEVICE/MSC_U-Disk/User/Internal_Flash.o \
./DOC/EXAM/USB/USBHS/DEVICE/MSC_U-Disk/User/SPI_FLASH.o \
./DOC/EXAM/USB/USBHS/DEVICE/MSC_U-Disk/User/SW_UDISK.o \
./DOC/EXAM/USB/USBHS/DEVICE/MSC_U-Disk/User/ch32v30x_it.o \
./DOC/EXAM/USB/USBHS/DEVICE/MSC_U-Disk/User/ch32v30x_usbhs_device.o \
./DOC/EXAM/USB/USBHS/DEVICE/MSC_U-Disk/User/main.o \
./DOC/EXAM/USB/USBHS/DEVICE/MSC_U-Disk/User/system_ch32v30x.o \
./DOC/EXAM/USB/USBHS/DEVICE/MSC_U-Disk/User/usb_desc.o 

DIR_OBJS += \
./DOC/EXAM/USB/USBHS/DEVICE/MSC_U-Disk/User/*.o \

DIR_DEPS += \
./DOC/EXAM/USB/USBHS/DEVICE/MSC_U-Disk/User/*.d \

DIR_EXPANDS += \
./DOC/EXAM/USB/USBHS/DEVICE/MSC_U-Disk/User/*.253r.expand \


# Each subdirectory must supply rules for building sources it contributes
DOC/EXAM/USB/USBHS/DEVICE/MSC_U-Disk/User/%.o: ../DOC/EXAM/USB/USBHS/DEVICE/MSC_U-Disk/User/%.c
	@	riscv-wch-elf-gcc -march=rv32imafcxw -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -fsingle-precision-constant -Wunused -Wuninitialized -g -I"/home/alarm/mounriver-studio-projects/testCH32V305/Debug" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Core" -I"/home/alarm/mounriver-studio-projects/testCH32V305/User" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Peripheral/inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"

