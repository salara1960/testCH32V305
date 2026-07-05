################################################################################
# MRS Version: 2.5.0
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../User/air.c \
../User/ch32v30x_it.c \
../User/fmram.c \
../User/fonts.c \
../User/func.c \
../User/i2c.c \
../User/lcd.c \
../User/main.c \
../User/rtc.c \
../User/sdio.c \
../User/system_ch32v30x.c 

C_DEPS += \
./User/air.d \
./User/ch32v30x_it.d \
./User/fmram.d \
./User/fonts.d \
./User/func.d \
./User/i2c.d \
./User/lcd.d \
./User/main.d \
./User/rtc.d \
./User/sdio.d \
./User/system_ch32v30x.d 

OBJS += \
./User/air.o \
./User/ch32v30x_it.o \
./User/fmram.o \
./User/fonts.o \
./User/func.o \
./User/i2c.o \
./User/lcd.o \
./User/main.o \
./User/rtc.o \
./User/sdio.o \
./User/system_ch32v30x.o 

DIR_OBJS += \
./User/*.o \

DIR_DEPS += \
./User/*.d \

DIR_EXPANDS += \
./User/*.253r.expand \


# Each subdirectory must supply rules for building sources it contributes
User/%.o: ../User/%.c
	@	riscv-wch-elf-gcc -march=rv32imafc_xw -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -fsingle-precision-constant -Wunused -Wuninitialized -g -DSET_FMRAM -DSET_AIR_MODULE -DSET_SDCARD -USET_BIG_PIC -I"/home/alarm/mounriver-studio-projects/testCH32V305/Debug" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Core" -I"/home/alarm/mounriver-studio-projects/testCH32V305/User" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Peripheral/inc" -std=gnu99 -v -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"

