################################################################################
# MRS Version: 2.3.0
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../DOC/EXAM/USART/USART_Interrupt/User/ch32v30x_it.c \
../DOC/EXAM/USART/USART_Interrupt/User/main.c \
../DOC/EXAM/USART/USART_Interrupt/User/system_ch32v30x.c 

C_DEPS += \
./DOC/EXAM/USART/USART_Interrupt/User/ch32v30x_it.d \
./DOC/EXAM/USART/USART_Interrupt/User/main.d \
./DOC/EXAM/USART/USART_Interrupt/User/system_ch32v30x.d 

OBJS += \
./DOC/EXAM/USART/USART_Interrupt/User/ch32v30x_it.o \
./DOC/EXAM/USART/USART_Interrupt/User/main.o \
./DOC/EXAM/USART/USART_Interrupt/User/system_ch32v30x.o 

DIR_OBJS += \
./DOC/EXAM/USART/USART_Interrupt/User/*.o \

DIR_DEPS += \
./DOC/EXAM/USART/USART_Interrupt/User/*.d \

DIR_EXPANDS += \
./DOC/EXAM/USART/USART_Interrupt/User/*.253r.expand \


# Each subdirectory must supply rules for building sources it contributes
DOC/EXAM/USART/USART_Interrupt/User/%.o: ../DOC/EXAM/USART/USART_Interrupt/User/%.c
	@	riscv-wch-elf-gcc -march=rv32imafcxw -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -fsingle-precision-constant -Wunused -Wuninitialized -g -I"/home/alarm/mounriver-studio-projects/testCH32V305/Debug" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Core" -I"/home/alarm/mounriver-studio-projects/testCH32V305/User" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Peripheral/inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"

