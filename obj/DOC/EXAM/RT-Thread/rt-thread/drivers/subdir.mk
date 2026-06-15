################################################################################
# MRS Version: 2.3.0
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../DOC/EXAM/RT-Thread/rt-thread/drivers/drv_gpio.c \
../DOC/EXAM/RT-Thread/rt-thread/drivers/drv_usart.c 

C_DEPS += \
./DOC/EXAM/RT-Thread/rt-thread/drivers/drv_gpio.d \
./DOC/EXAM/RT-Thread/rt-thread/drivers/drv_usart.d 

OBJS += \
./DOC/EXAM/RT-Thread/rt-thread/drivers/drv_gpio.o \
./DOC/EXAM/RT-Thread/rt-thread/drivers/drv_usart.o 

DIR_OBJS += \
./DOC/EXAM/RT-Thread/rt-thread/drivers/*.o \

DIR_DEPS += \
./DOC/EXAM/RT-Thread/rt-thread/drivers/*.d \

DIR_EXPANDS += \
./DOC/EXAM/RT-Thread/rt-thread/drivers/*.253r.expand \


# Each subdirectory must supply rules for building sources it contributes
DOC/EXAM/RT-Thread/rt-thread/drivers/%.o: ../DOC/EXAM/RT-Thread/rt-thread/drivers/%.c
	@	riscv-wch-elf-gcc -march=rv32imafcxw -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -fsingle-precision-constant -Wunused -Wuninitialized -g -I"/home/alarm/mounriver-studio-projects/testCH32V305/Debug" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Core" -I"/home/alarm/mounriver-studio-projects/testCH32V305/User" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Peripheral/inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"

