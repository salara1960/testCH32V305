################################################################################
# MRS Version: 2.3.0
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/utils/los_debug.c \
../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/utils/los_error.c \
../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/utils/los_hook.c 

C_DEPS += \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/utils/los_debug.d \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/utils/los_error.d \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/utils/los_hook.d 

OBJS += \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/utils/los_debug.o \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/utils/los_error.o \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/utils/los_hook.o 

DIR_OBJS += \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/utils/*.o \

DIR_DEPS += \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/utils/*.d \

DIR_EXPANDS += \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/utils/*.253r.expand \


# Each subdirectory must supply rules for building sources it contributes
DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/utils/%.o: ../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/utils/%.c
	@	riscv-wch-elf-gcc -march=rv32imafcxw -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -fsingle-precision-constant -Wunused -Wuninitialized -g -I"/home/alarm/mounriver-studio-projects/testCH32V305/Debug" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Core" -I"/home/alarm/mounriver-studio-projects/testCH32V305/User" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Peripheral/inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"

