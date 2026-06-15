################################################################################
# MRS Version: 2.3.0
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/arch/risc-v/V4A/gcc/los_context.c \
../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/arch/risc-v/V4A/gcc/los_interrupt.c \
../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/arch/risc-v/V4A/gcc/los_timer.c 

C_DEPS += \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/arch/risc-v/V4A/gcc/los_context.d \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/arch/risc-v/V4A/gcc/los_interrupt.d \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/arch/risc-v/V4A/gcc/los_timer.d 

S_UPPER_SRCS += \
../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/arch/risc-v/V4A/gcc/los_dispatch.S \
../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/arch/risc-v/V4A/gcc/los_exc.S 

S_UPPER_DEPS += \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/arch/risc-v/V4A/gcc/los_dispatch.d \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/arch/risc-v/V4A/gcc/los_exc.d 

OBJS += \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/arch/risc-v/V4A/gcc/los_context.o \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/arch/risc-v/V4A/gcc/los_dispatch.o \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/arch/risc-v/V4A/gcc/los_exc.o \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/arch/risc-v/V4A/gcc/los_interrupt.o \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/arch/risc-v/V4A/gcc/los_timer.o 

DIR_OBJS += \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/arch/risc-v/V4A/gcc/*.o \

DIR_DEPS += \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/arch/risc-v/V4A/gcc/*.d \

DIR_EXPANDS += \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/arch/risc-v/V4A/gcc/*.253r.expand \


# Each subdirectory must supply rules for building sources it contributes
DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/arch/risc-v/V4A/gcc/%.o: ../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/arch/risc-v/V4A/gcc/%.c
	@	riscv-wch-elf-gcc -march=rv32imafcxw -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -fsingle-precision-constant -Wunused -Wuninitialized -g -I"/home/alarm/mounriver-studio-projects/testCH32V305/Debug" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Core" -I"/home/alarm/mounriver-studio-projects/testCH32V305/User" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Peripheral/inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"

DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/arch/risc-v/V4A/gcc/%.o: ../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/arch/risc-v/V4A/gcc/%.S
	@	riscv-wch-elf-gcc -march=rv32imafcxw -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -fsingle-precision-constant -Wunused -Wuninitialized -g -x assembler-with-cpp -I"/home/alarm/mounriver-studio-projects/testCH32V305/Startup" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"

