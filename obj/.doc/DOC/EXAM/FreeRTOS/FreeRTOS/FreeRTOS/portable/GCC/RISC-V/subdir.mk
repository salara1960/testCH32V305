################################################################################
# MRS Version: 2.3.0
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../.doc/DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/portable/GCC/RISC-V/port.c 

C_DEPS += \
./.doc/DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/portable/GCC/RISC-V/port.d 

S_UPPER_SRCS += \
../.doc/DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/portable/GCC/RISC-V/portASM.S 

S_UPPER_DEPS += \
./.doc/DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/portable/GCC/RISC-V/portASM.d 

OBJS += \
./.doc/DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/portable/GCC/RISC-V/port.o \
./.doc/DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/portable/GCC/RISC-V/portASM.o 

DIR_OBJS += \
./.doc/DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/portable/GCC/RISC-V/*.o \

DIR_DEPS += \
./.doc/DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/portable/GCC/RISC-V/*.d \

DIR_EXPANDS += \
./.doc/DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/portable/GCC/RISC-V/*.253r.expand \


# Each subdirectory must supply rules for building sources it contributes
.doc/DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/portable/GCC/RISC-V/%.o: ../.doc/DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/portable/GCC/RISC-V/%.c
	@	riscv-wch-elf-gcc -march=rv32imafcxw -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -fsingle-precision-constant -Wunused -Wuninitialized -g -I"/home/alarm/mounriver-studio-projects/testCH32V305/Debug" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Core" -I"/home/alarm/mounriver-studio-projects/testCH32V305/User" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Peripheral/inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"

.doc/DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/portable/GCC/RISC-V/%.o: ../.doc/DOC/EXAM/FreeRTOS/FreeRTOS/FreeRTOS/portable/GCC/RISC-V/%.S
	@	riscv-wch-elf-gcc -march=rv32imafcxw -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -fsingle-precision-constant -Wunused -Wuninitialized -g -x assembler-with-cpp -I"/home/alarm/mounriver-studio-projects/testCH32V305/Startup" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"

