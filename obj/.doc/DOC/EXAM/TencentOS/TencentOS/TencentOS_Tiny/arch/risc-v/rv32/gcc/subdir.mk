################################################################################
# MRS Version: 2.3.0
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../.doc/DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/arch/risc-v/rv32/gcc/port_c.c 

C_DEPS += \
./.doc/DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/arch/risc-v/rv32/gcc/port_c.d 

S_UPPER_SRCS += \
../.doc/DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/arch/risc-v/rv32/gcc/port_s.S 

S_UPPER_DEPS += \
./.doc/DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/arch/risc-v/rv32/gcc/port_s.d 

OBJS += \
./.doc/DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/arch/risc-v/rv32/gcc/port_c.o \
./.doc/DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/arch/risc-v/rv32/gcc/port_s.o 

DIR_OBJS += \
./.doc/DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/arch/risc-v/rv32/gcc/*.o \

DIR_DEPS += \
./.doc/DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/arch/risc-v/rv32/gcc/*.d \

DIR_EXPANDS += \
./.doc/DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/arch/risc-v/rv32/gcc/*.253r.expand \


# Each subdirectory must supply rules for building sources it contributes
.doc/DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/arch/risc-v/rv32/gcc/%.o: ../.doc/DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/arch/risc-v/rv32/gcc/%.c
	@	riscv-wch-elf-gcc -march=rv32imafcxw -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -fsingle-precision-constant -Wunused -Wuninitialized -g -I"/home/alarm/mounriver-studio-projects/testCH32V305/Debug" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Core" -I"/home/alarm/mounriver-studio-projects/testCH32V305/User" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Peripheral/inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"

.doc/DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/arch/risc-v/rv32/gcc/%.o: ../.doc/DOC/EXAM/TencentOS/TencentOS/TencentOS_Tiny/arch/risc-v/rv32/gcc/%.S
	@	riscv-wch-elf-gcc -march=rv32imafcxw -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -fsingle-precision-constant -Wunused -Wuninitialized -g -x assembler-with-cpp -I"/home/alarm/mounriver-studio-projects/testCH32V305/Startup" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"

