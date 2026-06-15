################################################################################
# MRS Version: 2.3.0
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_UPPER_SRCS += \
../DOC/EXAM/INT/Interrupt_Nest/Startup/startup_ch32v30x_D8.S \
../DOC/EXAM/INT/Interrupt_Nest/Startup/startup_ch32v30x_D8C.S 

S_UPPER_DEPS += \
./DOC/EXAM/INT/Interrupt_Nest/Startup/startup_ch32v30x_D8.d \
./DOC/EXAM/INT/Interrupt_Nest/Startup/startup_ch32v30x_D8C.d 

OBJS += \
./DOC/EXAM/INT/Interrupt_Nest/Startup/startup_ch32v30x_D8.o \
./DOC/EXAM/INT/Interrupt_Nest/Startup/startup_ch32v30x_D8C.o 

DIR_OBJS += \
./DOC/EXAM/INT/Interrupt_Nest/Startup/*.o \

DIR_DEPS += \
./DOC/EXAM/INT/Interrupt_Nest/Startup/*.d \

DIR_EXPANDS += \
./DOC/EXAM/INT/Interrupt_Nest/Startup/*.253r.expand \


# Each subdirectory must supply rules for building sources it contributes
DOC/EXAM/INT/Interrupt_Nest/Startup/%.o: ../DOC/EXAM/INT/Interrupt_Nest/Startup/%.S
	@	riscv-wch-elf-gcc -march=rv32imafcxw -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -fsingle-precision-constant -Wunused -Wuninitialized -g -x assembler-with-cpp -I"/home/alarm/mounriver-studio-projects/testCH32V305/Startup" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"

