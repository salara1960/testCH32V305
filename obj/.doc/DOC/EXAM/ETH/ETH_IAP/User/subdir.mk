################################################################################
# MRS Version: 2.3.0
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../.doc/DOC/EXAM/ETH/ETH_IAP/User/IAP_Task.c \
../.doc/DOC/EXAM/ETH/ETH_IAP/User/ch32v30x_it.c \
../.doc/DOC/EXAM/ETH/ETH_IAP/User/main.c \
../.doc/DOC/EXAM/ETH/ETH_IAP/User/system_ch32v30x.c 

C_DEPS += \
./.doc/DOC/EXAM/ETH/ETH_IAP/User/IAP_Task.d \
./.doc/DOC/EXAM/ETH/ETH_IAP/User/ch32v30x_it.d \
./.doc/DOC/EXAM/ETH/ETH_IAP/User/main.d \
./.doc/DOC/EXAM/ETH/ETH_IAP/User/system_ch32v30x.d 

OBJS += \
./.doc/DOC/EXAM/ETH/ETH_IAP/User/IAP_Task.o \
./.doc/DOC/EXAM/ETH/ETH_IAP/User/ch32v30x_it.o \
./.doc/DOC/EXAM/ETH/ETH_IAP/User/main.o \
./.doc/DOC/EXAM/ETH/ETH_IAP/User/system_ch32v30x.o 

DIR_OBJS += \
./.doc/DOC/EXAM/ETH/ETH_IAP/User/*.o \

DIR_DEPS += \
./.doc/DOC/EXAM/ETH/ETH_IAP/User/*.d \

DIR_EXPANDS += \
./.doc/DOC/EXAM/ETH/ETH_IAP/User/*.253r.expand \


# Each subdirectory must supply rules for building sources it contributes
.doc/DOC/EXAM/ETH/ETH_IAP/User/%.o: ../.doc/DOC/EXAM/ETH/ETH_IAP/User/%.c
	@	riscv-wch-elf-gcc -march=rv32imafcxw -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -fsingle-precision-constant -Wunused -Wuninitialized -g -I"/home/alarm/mounriver-studio-projects/testCH32V305/Debug" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Core" -I"/home/alarm/mounriver-studio-projects/testCH32V305/User" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Peripheral/inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"

