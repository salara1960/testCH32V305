################################################################################
# MRS Version: 2.3.0
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_barrier.c \
../DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_binary_heap.c \
../DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_bitmap.c \
../DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_char_fifo.c \
../DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_completion.c \
../DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_countdownlatch.c \
../DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_event.c \
../DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_global.c \
../DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_mail_queue.c \
../DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_message_queue.c \
../DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_mmblk.c \
../DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_mmheap.c \
../DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_mutex.c \
../DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_pend.c \
../DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_priority_mail_queue.c \
../DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_priority_message_queue.c \
../DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_priority_queue.c \
../DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_ring_queue.c \
../DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_robin.c \
../DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_rwlock.c \
../DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_sched.c \
../DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_sem.c \
../DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_stopwatch.c \
../DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_sys.c \
../DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_task.c \
../DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_tick.c \
../DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_time.c \
../DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_timer.c 

C_DEPS += \
./DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_barrier.d \
./DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_binary_heap.d \
./DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_bitmap.d \
./DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_char_fifo.d \
./DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_completion.d \
./DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_countdownlatch.d \
./DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_event.d \
./DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_global.d \
./DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_mail_queue.d \
./DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_message_queue.d \
./DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_mmblk.d \
./DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_mmheap.d \
./DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_mutex.d \
./DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_pend.d \
./DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_priority_mail_queue.d \
./DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_priority_message_queue.d \
./DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_priority_queue.d \
./DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_ring_queue.d \
./DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_robin.d \
./DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_rwlock.d \
./DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_sched.d \
./DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_sem.d \
./DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_stopwatch.d \
./DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_sys.d \
./DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_task.d \
./DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_tick.d \
./DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_time.d \
./DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_timer.d 

OBJS += \
./DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_barrier.o \
./DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_binary_heap.o \
./DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_bitmap.o \
./DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_char_fifo.o \
./DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_completion.o \
./DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_countdownlatch.o \
./DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_event.o \
./DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_global.o \
./DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_mail_queue.o \
./DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_message_queue.o \
./DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_mmblk.o \
./DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_mmheap.o \
./DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_mutex.o \
./DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_pend.o \
./DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_priority_mail_queue.o \
./DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_priority_message_queue.o \
./DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_priority_queue.o \
./DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_ring_queue.o \
./DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_robin.o \
./DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_rwlock.o \
./DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_sched.o \
./DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_sem.o \
./DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_stopwatch.o \
./DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_sys.o \
./DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_task.o \
./DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_tick.o \
./DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_time.o \
./DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/tos_timer.o 

DIR_OBJS += \
./DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/*.o \

DIR_DEPS += \
./DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/*.d \

DIR_EXPANDS += \
./DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/*.253r.expand \


# Each subdirectory must supply rules for building sources it contributes
DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/%.o: ../DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/kernel/core/%.c
	@	riscv-wch-elf-gcc -march=rv32imafcxw -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -fsingle-precision-constant -Wunused -Wuninitialized -g -I"/home/alarm/mounriver-studio-projects/testCH32V305/Debug" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Core" -I"/home/alarm/mounriver-studio-projects/testCH32V305/User" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Peripheral/inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"

