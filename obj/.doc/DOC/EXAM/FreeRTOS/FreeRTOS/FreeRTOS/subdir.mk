################################################################################
# MRS Version: 2.3.0
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../.doc/DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/croutine.c \
../.doc/DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/event_groups.c \
../.doc/DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/list.c \
../.doc/DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/queue.c \
../.doc/DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/stream_buffer.c \
../.doc/DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/tasks.c \
../.doc/DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/timers.c 

C_DEPS += \
./.doc/DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/croutine.d \
./.doc/DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/event_groups.d \
./.doc/DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/list.d \
./.doc/DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/queue.d \
./.doc/DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/stream_buffer.d \
./.doc/DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/tasks.d \
./.doc/DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/timers.d 

OBJS += \
./.doc/DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/croutine.o \
./.doc/DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/event_groups.o \
./.doc/DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/list.o \
./.doc/DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/queue.o \
./.doc/DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/stream_buffer.o \
./.doc/DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/tasks.o \
./.doc/DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/timers.o 

DIR_OBJS += \
./.doc/DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/*.o \

DIR_DEPS += \
./.doc/DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/*.d \

DIR_EXPANDS += \
./.doc/DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/*.253r.expand \


# Each subdirectory must supply rules for building sources it contributes
.doc/DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/%.o: ../.doc/DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/%.c
	@	riscv-wch-elf-gcc -march=rv32imafcxw -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -fsingle-precision-constant -Wunused -Wuninitialized -g -I"/home/alarm/mounriver-studio-projects/testCH32V305/Debug" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Core" -I"/home/alarm/mounriver-studio-projects/testCH32V305/User" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Peripheral/inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"

