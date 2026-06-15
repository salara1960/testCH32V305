################################################################################
# MRS Version: 2.3.0
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/errno.c \
../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/libc.c \
../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/malloc.c \
../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/mqueue.c \
../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/pthread.c \
../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/pthread_attr.c \
../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/pthread_cond.c \
../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/pthread_mutex.c \
../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/semaphore.c \
../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/time.c 

C_DEPS += \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/errno.d \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/libc.d \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/malloc.d \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/mqueue.d \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/pthread.d \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/pthread_attr.d \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/pthread_cond.d \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/pthread_mutex.d \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/semaphore.d \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/time.d 

OBJS += \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/errno.o \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/libc.o \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/malloc.o \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/mqueue.o \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/pthread.o \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/pthread_attr.o \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/pthread_cond.o \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/pthread_mutex.o \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/semaphore.o \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/time.o 

DIR_OBJS += \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/*.o \

DIR_DEPS += \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/*.d \

DIR_EXPANDS += \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/*.253r.expand \


# Each subdirectory must supply rules for building sources it contributes
.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/%.o: ../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/%.c
	@	riscv-wch-elf-gcc -march=rv32imafcxw -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -fsingle-precision-constant -Wunused -Wuninitialized -g -I"/home/alarm/mounriver-studio-projects/testCH32V305/Debug" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Core" -I"/home/alarm/mounriver-studio-projects/testCH32V305/User" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Peripheral/inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"

