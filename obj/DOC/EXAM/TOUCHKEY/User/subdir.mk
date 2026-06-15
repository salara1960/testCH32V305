################################################################################
# MRS Version: 2.3.0
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../DOC/EXAM/TOUCHKEY/User/ch32v30x_it.c \
../DOC/EXAM/TOUCHKEY/User/main.c \
../DOC/EXAM/TOUCHKEY/User/system_ch32v30x.c 

C_DEPS += \
./DOC/EXAM/TOUCHKEY/User/ch32v30x_it.d \
./DOC/EXAM/TOUCHKEY/User/main.d \
./DOC/EXAM/TOUCHKEY/User/system_ch32v30x.d 

OBJS += \
./DOC/EXAM/TOUCHKEY/User/ch32v30x_it.o \
./DOC/EXAM/TOUCHKEY/User/main.o \
./DOC/EXAM/TOUCHKEY/User/system_ch32v30x.o 

DIR_OBJS += \
./DOC/EXAM/TOUCHKEY/User/*.o \

DIR_DEPS += \
./DOC/EXAM/TOUCHKEY/User/*.d \

DIR_EXPANDS += \
./DOC/EXAM/TOUCHKEY/User/*.253r.expand \


# Each subdirectory must supply rules for building sources it contributes
DOC/EXAM/TOUCHKEY/User/%.o: ../DOC/EXAM/TOUCHKEY/User/%.c
	@	riscv-wch-elf-gcc -march=rv32imafcxw -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -fsingle-precision-constant -Wunused -Wuninitialized -g -I"/home/alarm/mounriver-studio-projects/testCH32V305/Debug" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Core" -I"/home/alarm/mounriver-studio-projects/testCH32V305/User" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Peripheral/inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"

