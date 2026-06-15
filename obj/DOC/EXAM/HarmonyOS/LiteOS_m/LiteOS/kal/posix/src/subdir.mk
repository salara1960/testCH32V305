################################################################################
# MRS Version: 2.3.0
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/errno.c \
../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/libc.c \
../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/malloc.c \
../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/mqueue.c \
../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/pthread.c \
../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/pthread_attr.c \
../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/pthread_cond.c \
../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/pthread_mutex.c \
../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/semaphore.c \
../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/time.c 

C_DEPS += \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/errno.d \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/libc.d \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/malloc.d \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/mqueue.d \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/pthread.d \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/pthread_attr.d \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/pthread_cond.d \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/pthread_mutex.d \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/semaphore.d \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/time.d 

OBJS += \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/errno.o \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/libc.o \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/malloc.o \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/mqueue.o \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/pthread.o \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/pthread_attr.o \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/pthread_cond.o \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/pthread_mutex.o \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/semaphore.o \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/time.o 

DIR_OBJS += \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/*.o \

DIR_DEPS += \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/*.d \

DIR_EXPANDS += \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/*.253r.expand \


# Each subdirectory must supply rules for building sources it contributes
DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/%.o: ../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/kal/posix/src/%.c
	@	riscv-wch-elf-gcc -march=rv32imafcxw -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -fsingle-precision-constant -Wunused -Wuninitialized -g -I"/home/alarm/mounriver-studio-projects/testCH32V305/Debug" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Core" -I"/home/alarm/mounriver-studio-projects/testCH32V305/User" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Peripheral/inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"

