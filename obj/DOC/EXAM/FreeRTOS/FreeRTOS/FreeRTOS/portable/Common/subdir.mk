################################################################################
# MRS Version: 2.3.0
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/portable/Common/mpu_wrappers.c 

C_DEPS += \
./DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/portable/Common/mpu_wrappers.d 

OBJS += \
./DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/portable/Common/mpu_wrappers.o 

DIR_OBJS += \
./DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/portable/Common/*.o \

DIR_DEPS += \
./DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/portable/Common/*.d \

DIR_EXPANDS += \
./DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/portable/Common/*.253r.expand \


# Each subdirectory must supply rules for building sources it contributes
DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/portable/Common/%.o: ../DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/portable/Common/%.c
	@	riscv-wch-elf-gcc -march=rv32imafcxw -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -fsingle-precision-constant -Wunused -Wuninitialized -g -I"/home/alarm/mounriver-studio-projects/testCH32V305/Debug" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Core" -I"/home/alarm/mounriver-studio-projects/testCH32V305/User" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Peripheral/inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"

