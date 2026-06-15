################################################################################
# MRS Version: 2.3.0
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../DOC/EXAM/RT-Thread/rt-thread/rtthread/src/clock.c \
../DOC/EXAM/RT-Thread/rt-thread/rtthread/src/components.c \
../DOC/EXAM/RT-Thread/rt-thread/rtthread/src/cpu.c \
../DOC/EXAM/RT-Thread/rt-thread/rtthread/src/device.c \
../DOC/EXAM/RT-Thread/rt-thread/rtthread/src/idle.c \
../DOC/EXAM/RT-Thread/rt-thread/rtthread/src/ipc.c \
../DOC/EXAM/RT-Thread/rt-thread/rtthread/src/irq.c \
../DOC/EXAM/RT-Thread/rt-thread/rtthread/src/kservice.c \
../DOC/EXAM/RT-Thread/rt-thread/rtthread/src/mem.c \
../DOC/EXAM/RT-Thread/rt-thread/rtthread/src/memheap.c \
../DOC/EXAM/RT-Thread/rt-thread/rtthread/src/mempool.c \
../DOC/EXAM/RT-Thread/rt-thread/rtthread/src/object.c \
../DOC/EXAM/RT-Thread/rt-thread/rtthread/src/scheduler.c \
../DOC/EXAM/RT-Thread/rt-thread/rtthread/src/slab.c \
../DOC/EXAM/RT-Thread/rt-thread/rtthread/src/thread.c \
../DOC/EXAM/RT-Thread/rt-thread/rtthread/src/timer.c 

C_DEPS += \
./DOC/EXAM/RT-Thread/rt-thread/rtthread/src/clock.d \
./DOC/EXAM/RT-Thread/rt-thread/rtthread/src/components.d \
./DOC/EXAM/RT-Thread/rt-thread/rtthread/src/cpu.d \
./DOC/EXAM/RT-Thread/rt-thread/rtthread/src/device.d \
./DOC/EXAM/RT-Thread/rt-thread/rtthread/src/idle.d \
./DOC/EXAM/RT-Thread/rt-thread/rtthread/src/ipc.d \
./DOC/EXAM/RT-Thread/rt-thread/rtthread/src/irq.d \
./DOC/EXAM/RT-Thread/rt-thread/rtthread/src/kservice.d \
./DOC/EXAM/RT-Thread/rt-thread/rtthread/src/mem.d \
./DOC/EXAM/RT-Thread/rt-thread/rtthread/src/memheap.d \
./DOC/EXAM/RT-Thread/rt-thread/rtthread/src/mempool.d \
./DOC/EXAM/RT-Thread/rt-thread/rtthread/src/object.d \
./DOC/EXAM/RT-Thread/rt-thread/rtthread/src/scheduler.d \
./DOC/EXAM/RT-Thread/rt-thread/rtthread/src/slab.d \
./DOC/EXAM/RT-Thread/rt-thread/rtthread/src/thread.d \
./DOC/EXAM/RT-Thread/rt-thread/rtthread/src/timer.d 

OBJS += \
./DOC/EXAM/RT-Thread/rt-thread/rtthread/src/clock.o \
./DOC/EXAM/RT-Thread/rt-thread/rtthread/src/components.o \
./DOC/EXAM/RT-Thread/rt-thread/rtthread/src/cpu.o \
./DOC/EXAM/RT-Thread/rt-thread/rtthread/src/device.o \
./DOC/EXAM/RT-Thread/rt-thread/rtthread/src/idle.o \
./DOC/EXAM/RT-Thread/rt-thread/rtthread/src/ipc.o \
./DOC/EXAM/RT-Thread/rt-thread/rtthread/src/irq.o \
./DOC/EXAM/RT-Thread/rt-thread/rtthread/src/kservice.o \
./DOC/EXAM/RT-Thread/rt-thread/rtthread/src/mem.o \
./DOC/EXAM/RT-Thread/rt-thread/rtthread/src/memheap.o \
./DOC/EXAM/RT-Thread/rt-thread/rtthread/src/mempool.o \
./DOC/EXAM/RT-Thread/rt-thread/rtthread/src/object.o \
./DOC/EXAM/RT-Thread/rt-thread/rtthread/src/scheduler.o \
./DOC/EXAM/RT-Thread/rt-thread/rtthread/src/slab.o \
./DOC/EXAM/RT-Thread/rt-thread/rtthread/src/thread.o \
./DOC/EXAM/RT-Thread/rt-thread/rtthread/src/timer.o 

DIR_OBJS += \
./DOC/EXAM/RT-Thread/rt-thread/rtthread/src/*.o \

DIR_DEPS += \
./DOC/EXAM/RT-Thread/rt-thread/rtthread/src/*.d \

DIR_EXPANDS += \
./DOC/EXAM/RT-Thread/rt-thread/rtthread/src/*.253r.expand \


# Each subdirectory must supply rules for building sources it contributes
DOC/EXAM/RT-Thread/rt-thread/rtthread/src/%.o: ../DOC/EXAM/RT-Thread/rt-thread/rtthread/src/%.c
	@	riscv-wch-elf-gcc -march=rv32imafcxw -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -fsingle-precision-constant -Wunused -Wuninitialized -g -I"/home/alarm/mounriver-studio-projects/testCH32V305/Debug" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Core" -I"/home/alarm/mounriver-studio-projects/testCH32V305/User" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Peripheral/inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"

