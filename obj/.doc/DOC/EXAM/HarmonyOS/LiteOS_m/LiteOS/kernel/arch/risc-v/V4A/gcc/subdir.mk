################################################################################
# MRS Version: 2.3.0
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/arch/risc-v/V4A/gcc/los_context.c \
../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/arch/risc-v/V4A/gcc/los_interrupt.c \
../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/arch/risc-v/V4A/gcc/los_timer.c 

C_DEPS += \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/arch/risc-v/V4A/gcc/los_context.d \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/arch/risc-v/V4A/gcc/los_interrupt.d \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/arch/risc-v/V4A/gcc/los_timer.d 

S_UPPER_SRCS += \
../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/arch/risc-v/V4A/gcc/los_dispatch.S \
../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/arch/risc-v/V4A/gcc/los_exc.S 

S_UPPER_DEPS += \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/arch/risc-v/V4A/gcc/los_dispatch.d \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/arch/risc-v/V4A/gcc/los_exc.d 

OBJS += \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/arch/risc-v/V4A/gcc/los_context.o \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/arch/risc-v/V4A/gcc/los_dispatch.o \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/arch/risc-v/V4A/gcc/los_exc.o \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/arch/risc-v/V4A/gcc/los_interrupt.o \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/arch/risc-v/V4A/gcc/los_timer.o 

DIR_OBJS += \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/arch/risc-v/V4A/gcc/*.o \

DIR_DEPS += \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/arch/risc-v/V4A/gcc/*.d \

DIR_EXPANDS += \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/arch/risc-v/V4A/gcc/*.253r.expand \


# Each subdirectory must supply rules for building sources it contributes
.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/arch/risc-v/V4A/gcc/%.o: ../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/arch/risc-v/V4A/gcc/%.c
	@	riscv-wch-elf-gcc -march=rv32imafcxw -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -fsingle-precision-constant -Wunused -Wuninitialized -g -I"/home/alarm/mounriver-studio-projects/testCH32V305/Debug" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Core" -I"/home/alarm/mounriver-studio-projects/testCH32V305/User" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Peripheral/inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"

.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/arch/risc-v/V4A/gcc/%.o: ../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/arch/risc-v/V4A/gcc/%.S
	@	riscv-wch-elf-gcc -march=rv32imafcxw -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -fsingle-precision-constant -Wunused -Wuninitialized -g -x assembler-with-cpp -I"/home/alarm/mounriver-studio-projects/testCH32V305/Startup" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"

