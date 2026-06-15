################################################################################
# MRS Version: 2.3.0
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../DOC/EXAM/RT-Thread/rt-thread/rtthread/components/finsh/cmd.c \
../DOC/EXAM/RT-Thread/rt-thread/rtthread/components/finsh/msh.c \
../DOC/EXAM/RT-Thread/rt-thread/rtthread/components/finsh/msh_cmd.c \
../DOC/EXAM/RT-Thread/rt-thread/rtthread/components/finsh/msh_file.c \
../DOC/EXAM/RT-Thread/rt-thread/rtthread/components/finsh/shell.c \
../DOC/EXAM/RT-Thread/rt-thread/rtthread/components/finsh/symbol.c 

C_DEPS += \
./DOC/EXAM/RT-Thread/rt-thread/rtthread/components/finsh/cmd.d \
./DOC/EXAM/RT-Thread/rt-thread/rtthread/components/finsh/msh.d \
./DOC/EXAM/RT-Thread/rt-thread/rtthread/components/finsh/msh_cmd.d \
./DOC/EXAM/RT-Thread/rt-thread/rtthread/components/finsh/msh_file.d \
./DOC/EXAM/RT-Thread/rt-thread/rtthread/components/finsh/shell.d \
./DOC/EXAM/RT-Thread/rt-thread/rtthread/components/finsh/symbol.d 

OBJS += \
./DOC/EXAM/RT-Thread/rt-thread/rtthread/components/finsh/cmd.o \
./DOC/EXAM/RT-Thread/rt-thread/rtthread/components/finsh/msh.o \
./DOC/EXAM/RT-Thread/rt-thread/rtthread/components/finsh/msh_cmd.o \
./DOC/EXAM/RT-Thread/rt-thread/rtthread/components/finsh/msh_file.o \
./DOC/EXAM/RT-Thread/rt-thread/rtthread/components/finsh/shell.o \
./DOC/EXAM/RT-Thread/rt-thread/rtthread/components/finsh/symbol.o 

DIR_OBJS += \
./DOC/EXAM/RT-Thread/rt-thread/rtthread/components/finsh/*.o \

DIR_DEPS += \
./DOC/EXAM/RT-Thread/rt-thread/rtthread/components/finsh/*.d \

DIR_EXPANDS += \
./DOC/EXAM/RT-Thread/rt-thread/rtthread/components/finsh/*.253r.expand \


# Each subdirectory must supply rules for building sources it contributes
DOC/EXAM/RT-Thread/rt-thread/rtthread/components/finsh/%.o: ../DOC/EXAM/RT-Thread/rt-thread/rtthread/components/finsh/%.c
	@	riscv-wch-elf-gcc -march=rv32imafcxw -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -fsingle-precision-constant -Wunused -Wuninitialized -g -I"/home/alarm/mounriver-studio-projects/testCH32V305/Debug" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Core" -I"/home/alarm/mounriver-studio-projects/testCH32V305/User" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Peripheral/inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"

