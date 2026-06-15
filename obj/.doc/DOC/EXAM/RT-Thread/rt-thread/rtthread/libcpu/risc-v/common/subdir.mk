################################################################################
# MRS Version: 2.3.0
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/libcpu/risc-v/common/cpuport.c 

C_DEPS += \
./.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/libcpu/risc-v/common/cpuport.d 

S_UPPER_SRCS += \
../.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/libcpu/risc-v/common/context_gcc.S \
../.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/libcpu/risc-v/common/interrupt_gcc.S 

S_UPPER_DEPS += \
./.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/libcpu/risc-v/common/context_gcc.d \
./.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/libcpu/risc-v/common/interrupt_gcc.d 

OBJS += \
./.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/libcpu/risc-v/common/context_gcc.o \
./.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/libcpu/risc-v/common/cpuport.o \
./.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/libcpu/risc-v/common/interrupt_gcc.o 

DIR_OBJS += \
./.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/libcpu/risc-v/common/*.o \

DIR_DEPS += \
./.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/libcpu/risc-v/common/*.d \

DIR_EXPANDS += \
./.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/libcpu/risc-v/common/*.253r.expand \


# Each subdirectory must supply rules for building sources it contributes
.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/libcpu/risc-v/common/%.o: ../.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/libcpu/risc-v/common/%.c
	@	riscv-wch-elf-gcc -march=rv32imafcxw -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -fsingle-precision-constant -Wunused -Wuninitialized -g -I"/home/alarm/mounriver-studio-projects/testCH32V305/Debug" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Core" -I"/home/alarm/mounriver-studio-projects/testCH32V305/User" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Peripheral/inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"

.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/libcpu/risc-v/common/%.o: ../.doc/DOC/EXAM/RT-Thread/rt-thread/rtthread/libcpu/risc-v/common/%.S
	@	riscv-wch-elf-gcc -march=rv32imafcxw -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -fsingle-precision-constant -Wunused -Wuninitialized -g -x assembler-with-cpp -I"/home/alarm/mounriver-studio-projects/testCH32V305/Startup" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"

