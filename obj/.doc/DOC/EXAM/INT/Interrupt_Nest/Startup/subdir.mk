################################################################################
# MRS Version: 2.3.0
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_UPPER_SRCS += \
../.doc/DOC/EXAM/INT/Interrupt_Nest/Startup/startup_ch32v30x_D8.S \
../.doc/DOC/EXAM/INT/Interrupt_Nest/Startup/startup_ch32v30x_D8C.S 

S_UPPER_DEPS += \
./.doc/DOC/EXAM/INT/Interrupt_Nest/Startup/startup_ch32v30x_D8.d \
./.doc/DOC/EXAM/INT/Interrupt_Nest/Startup/startup_ch32v30x_D8C.d 

OBJS += \
./.doc/DOC/EXAM/INT/Interrupt_Nest/Startup/startup_ch32v30x_D8.o \
./.doc/DOC/EXAM/INT/Interrupt_Nest/Startup/startup_ch32v30x_D8C.o 

DIR_OBJS += \
./.doc/DOC/EXAM/INT/Interrupt_Nest/Startup/*.o \

DIR_DEPS += \
./.doc/DOC/EXAM/INT/Interrupt_Nest/Startup/*.d \

DIR_EXPANDS += \
./.doc/DOC/EXAM/INT/Interrupt_Nest/Startup/*.253r.expand \


# Each subdirectory must supply rules for building sources it contributes
.doc/DOC/EXAM/INT/Interrupt_Nest/Startup/%.o: ../.doc/DOC/EXAM/INT/Interrupt_Nest/Startup/%.S
	@	riscv-wch-elf-gcc -march=rv32imafcxw -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -fsingle-precision-constant -Wunused -Wuninitialized -g -x assembler-with-cpp -I"/home/alarm/mounriver-studio-projects/testCH32V305/Startup" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"

