################################################################################
# MRS Version: 2.3.0
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/mm/los_membox.c \
../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/mm/los_memory.c 

C_DEPS += \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/mm/los_membox.d \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/mm/los_memory.d 

OBJS += \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/mm/los_membox.o \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/mm/los_memory.o 

DIR_OBJS += \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/mm/*.o \

DIR_DEPS += \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/mm/*.d \

DIR_EXPANDS += \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/mm/*.253r.expand \


# Each subdirectory must supply rules for building sources it contributes
.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/mm/%.o: ../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/mm/%.c
	@	riscv-wch-elf-gcc -march=rv32imafcxw -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -fsingle-precision-constant -Wunused -Wuninitialized -g -I"/home/alarm/mounriver-studio-projects/testCH32V305/Debug" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Core" -I"/home/alarm/mounriver-studio-projects/testCH32V305/User" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Peripheral/inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"

