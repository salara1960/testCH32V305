################################################################################
# MRS Version: 2.3.0
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../.doc/DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/arch/risc-v/common/tos_cpu.c 

C_DEPS += \
./.doc/DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/arch/risc-v/common/tos_cpu.d 

OBJS += \
./.doc/DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/arch/risc-v/common/tos_cpu.o 

DIR_OBJS += \
./.doc/DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/arch/risc-v/common/*.o \

DIR_DEPS += \
./.doc/DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/arch/risc-v/common/*.d \

DIR_EXPANDS += \
./.doc/DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/arch/risc-v/common/*.253r.expand \


# Each subdirectory must supply rules for building sources it contributes
.doc/DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/arch/risc-v/common/%.o: ../.doc/DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/arch/risc-v/common/%.c
	@	riscv-wch-elf-gcc -march=rv32imafcxw -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -fsingle-precision-constant -Wunused -Wuninitialized -g -I"/home/alarm/mounriver-studio-projects/testCH32V305/Debug" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Core" -I"/home/alarm/mounriver-studio-projects/testCH32V305/User" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Peripheral/inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"

