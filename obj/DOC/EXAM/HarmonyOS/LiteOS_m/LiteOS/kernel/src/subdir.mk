################################################################################
# MRS Version: 2.3.0
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/los_event.c \
../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/los_init.c \
../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/los_mux.c \
../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/los_queue.c \
../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/los_sched.c \
../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/los_sem.c \
../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/los_sortlink.c \
../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/los_swtmr.c \
../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/los_task.c \
../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/los_tick.c 

C_DEPS += \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/los_event.d \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/los_init.d \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/los_mux.d \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/los_queue.d \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/los_sched.d \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/los_sem.d \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/los_sortlink.d \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/los_swtmr.d \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/los_task.d \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/los_tick.d 

OBJS += \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/los_event.o \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/los_init.o \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/los_mux.o \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/los_queue.o \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/los_sched.o \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/los_sem.o \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/los_sortlink.o \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/los_swtmr.o \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/los_task.o \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/los_tick.o 

DIR_OBJS += \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/*.o \

DIR_DEPS += \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/*.d \

DIR_EXPANDS += \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/*.253r.expand \


# Each subdirectory must supply rules for building sources it contributes
DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/%.o: ../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/%.c
	@	riscv-wch-elf-gcc -march=rv32imafcxw -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -fsingle-precision-constant -Wunused -Wuninitialized -g -I"/home/alarm/mounriver-studio-projects/testCH32V305/Debug" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Core" -I"/home/alarm/mounriver-studio-projects/testCH32V305/User" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Peripheral/inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"

