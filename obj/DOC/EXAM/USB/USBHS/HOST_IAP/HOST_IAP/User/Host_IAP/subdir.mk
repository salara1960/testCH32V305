################################################################################
# MRS Version: 2.3.0
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../DOC/EXAM/USB/USBHS/HOST_IAP/HOST_IAP/User/Host_IAP/usb_host_iap.c 

C_DEPS += \
./DOC/EXAM/USB/USBHS/HOST_IAP/HOST_IAP/User/Host_IAP/usb_host_iap.d 

OBJS += \
./DOC/EXAM/USB/USBHS/HOST_IAP/HOST_IAP/User/Host_IAP/usb_host_iap.o 

DIR_OBJS += \
./DOC/EXAM/USB/USBHS/HOST_IAP/HOST_IAP/User/Host_IAP/*.o \

DIR_DEPS += \
./DOC/EXAM/USB/USBHS/HOST_IAP/HOST_IAP/User/Host_IAP/*.d \

DIR_EXPANDS += \
./DOC/EXAM/USB/USBHS/HOST_IAP/HOST_IAP/User/Host_IAP/*.253r.expand \


# Each subdirectory must supply rules for building sources it contributes
DOC/EXAM/USB/USBHS/HOST_IAP/HOST_IAP/User/Host_IAP/%.o: ../DOC/EXAM/USB/USBHS/HOST_IAP/HOST_IAP/User/Host_IAP/%.c
	@	riscv-wch-elf-gcc -march=rv32imafcxw -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -fsingle-precision-constant -Wunused -Wuninitialized -g -I"/home/alarm/mounriver-studio-projects/testCH32V305/Debug" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Core" -I"/home/alarm/mounriver-studio-projects/testCH32V305/User" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Peripheral/inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"

