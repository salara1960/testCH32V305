################################################################################
# MRS Version: 2.3.0
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/src/clock.c \
../.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/src/components.c \
../.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/src/cpu.c \
../.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/src/device.c \
../.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/src/idle.c \
../.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/src/ipc.c \
../.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/src/irq.c \
../.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/src/kservice.c \
../.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/src/mem.c \
../.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/src/memheap.c \
../.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/src/mempool.c \
../.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/src/object.c \
../.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/src/scheduler.c \
../.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/src/slab.c \
../.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/src/thread.c \
../.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/src/timer.c 

C_DEPS += \
./.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/src/clock.d \
./.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/src/components.d \
./.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/src/cpu.d \
./.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/src/device.d \
./.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/src/idle.d \
./.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/src/ipc.d \
./.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/src/irq.d \
./.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/src/kservice.d \
./.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/src/mem.d \
./.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/src/memheap.d \
./.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/src/mempool.d \
./.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/src/object.d \
./.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/src/scheduler.d \
./.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/src/slab.d \
./.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/src/thread.d \
./.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/src/timer.d 

OBJS += \
./.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/src/clock.o \
./.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/src/components.o \
./.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/src/cpu.o \
./.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/src/device.o \
./.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/src/idle.o \
./.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/src/ipc.o \
./.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/src/irq.o \
./.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/src/kservice.o \
./.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/src/mem.o \
./.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/src/memheap.o \
./.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/src/mempool.o \
./.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/src/object.o \
./.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/src/scheduler.o \
./.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/src/slab.o \
./.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/src/thread.o \
./.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/src/timer.o 

DIR_OBJS += \
./.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/src/*.o \

DIR_DEPS += \
./.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/src/*.d \

DIR_EXPANDS += \
./.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/src/*.253r.expand \


# Each subdirectory must supply rules for building sources it contributes
.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/src/%.o: ../.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/src/%.c
	@	riscv-wch-elf-gcc -march=rv32imafcxw -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -fsingle-precision-constant -Wunused -Wuninitialized -g -I"/home/alarm/mounriver-studio-projects/testCH32V305/Debug" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Core" -I"/home/alarm/mounriver-studio-projects/testCH32V305/User" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Peripheral/inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"

