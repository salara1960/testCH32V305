################################################################################
# MRS Version: 2.3.0
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../DOC/EXAM/USB/USBHS/DEVICE/CompositeKM/User/ch32v30x_it.c \
../DOC/EXAM/USB/USBHS/DEVICE/CompositeKM/User/ch32v30x_usbhs_device.c \
../DOC/EXAM/USB/USBHS/DEVICE/CompositeKM/User/main.c \
../DOC/EXAM/USB/USBHS/DEVICE/CompositeKM/User/system_ch32v30x.c \
../DOC/EXAM/USB/USBHS/DEVICE/CompositeKM/User/usbd_compostie_km.c \
../DOC/EXAM/USB/USBHS/DEVICE/CompositeKM/User/usbd_desc.c 

C_DEPS += \
./DOC/EXAM/USB/USBHS/DEVICE/CompositeKM/User/ch32v30x_it.d \
./DOC/EXAM/USB/USBHS/DEVICE/CompositeKM/User/ch32v30x_usbhs_device.d \
./DOC/EXAM/USB/USBHS/DEVICE/CompositeKM/User/main.d \
./DOC/EXAM/USB/USBHS/DEVICE/CompositeKM/User/system_ch32v30x.d \
./DOC/EXAM/USB/USBHS/DEVICE/CompositeKM/User/usbd_compostie_km.d \
./DOC/EXAM/USB/USBHS/DEVICE/CompositeKM/User/usbd_desc.d 

OBJS += \
./DOC/EXAM/USB/USBHS/DEVICE/CompositeKM/User/ch32v30x_it.o \
./DOC/EXAM/USB/USBHS/DEVICE/CompositeKM/User/ch32v30x_usbhs_device.o \
./DOC/EXAM/USB/USBHS/DEVICE/CompositeKM/User/main.o \
./DOC/EXAM/USB/USBHS/DEVICE/CompositeKM/User/system_ch32v30x.o \
./DOC/EXAM/USB/USBHS/DEVICE/CompositeKM/User/usbd_compostie_km.o \
./DOC/EXAM/USB/USBHS/DEVICE/CompositeKM/User/usbd_desc.o 

DIR_OBJS += \
./DOC/EXAM/USB/USBHS/DEVICE/CompositeKM/User/*.o \

DIR_DEPS += \
./DOC/EXAM/USB/USBHS/DEVICE/CompositeKM/User/*.d \

DIR_EXPANDS += \
./DOC/EXAM/USB/USBHS/DEVICE/CompositeKM/User/*.253r.expand \


# Each subdirectory must supply rules for building sources it contributes
DOC/EXAM/USB/USBHS/DEVICE/CompositeKM/User/%.o: ../DOC/EXAM/USB/USBHS/DEVICE/CompositeKM/User/%.c
	@	riscv-wch-elf-gcc -march=rv32imafcxw -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -fsingle-precision-constant -Wunused -Wuninitialized -g -I"/home/alarm/mounriver-studio-projects/testCH32V305/Debug" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Core" -I"/home/alarm/mounriver-studio-projects/testCH32V305/User" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Peripheral/inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"

