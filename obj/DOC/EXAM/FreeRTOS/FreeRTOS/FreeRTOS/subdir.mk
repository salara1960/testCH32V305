################################################################################
# MRS Version: 2.3.0
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/croutine.c \
../DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/event_groups.c \
../DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/list.c \
../DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/queue.c \
../DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/stream_buffer.c \
../DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/tasks.c \
../DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/timers.c 

C_DEPS += \
./DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/croutine.d \
./DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/event_groups.d \
./DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/list.d \
./DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/queue.d \
./DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/stream_buffer.d \
./DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/tasks.d \
./DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/timers.d 

OBJS += \
./DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/croutine.o \
./DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/event_groups.o \
./DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/list.o \
./DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/queue.o \
./DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/stream_buffer.o \
./DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/tasks.o \
./DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/timers.o 

DIR_OBJS += \
./DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/*.o \

DIR_DEPS += \
./DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/*.d \

DIR_EXPANDS += \
./DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/*.253r.expand \


# Each subdirectory must supply rules for building sources it contributes
DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/%.o: ../DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/%.c
	@	riscv-wch-elf-gcc -march=rv32imafcxw -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -fsingle-precision-constant -Wunused -Wuninitialized -g -I"/home/alarm/mounriver-studio-projects/testCH32V305/Debug" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Core" -I"/home/alarm/mounriver-studio-projects/testCH32V305/User" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Peripheral/inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"

