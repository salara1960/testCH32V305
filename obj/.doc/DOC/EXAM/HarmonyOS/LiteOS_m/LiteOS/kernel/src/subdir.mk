################################################################################
# MRS Version: 2.3.0
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/los_event.c \
../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/los_init.c \
../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/los_mux.c \
../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/los_queue.c \
../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/los_sched.c \
../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/los_sem.c \
../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/los_sortlink.c \
../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/los_swtmr.c \
../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/los_task.c \
../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/los_tick.c 

C_DEPS += \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/los_event.d \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/los_init.d \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/los_mux.d \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/los_queue.d \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/los_sched.d \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/los_sem.d \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/los_sortlink.d \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/los_swtmr.d \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/los_task.d \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/los_tick.d 

OBJS += \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/los_event.o \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/los_init.o \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/los_mux.o \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/los_queue.o \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/los_sched.o \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/los_sem.o \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/los_sortlink.o \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/los_swtmr.o \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/los_task.o \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/los_tick.o 

DIR_OBJS += \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/*.o \

DIR_DEPS += \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/*.d \

DIR_EXPANDS += \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/*.253r.expand \


# Each subdirectory must supply rules for building sources it contributes
.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/%.o: ../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kernel/src/%.c
	@	riscv-wch-elf-gcc -march=rv32imafcxw -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -fsingle-precision-constant -Wunused -Wuninitialized -g -I"/home/alarm/mounriver-studio-projects/testCH32V305/Debug" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Core" -I"/home/alarm/mounriver-studio-projects/testCH32V305/User" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Peripheral/inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"

