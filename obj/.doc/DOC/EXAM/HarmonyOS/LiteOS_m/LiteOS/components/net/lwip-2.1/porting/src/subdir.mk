################################################################################
# MRS Version: 2.3.0
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/lwip-2.1/porting/src/driverif.c \
../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/lwip-2.1/porting/src/lwip_init.c \
../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/lwip-2.1/porting/src/netdb_porting.c \
../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/lwip-2.1/porting/src/sockets_porting.c \
../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/lwip-2.1/porting/src/sys_arch.c 

C_DEPS += \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/lwip-2.1/porting/src/driverif.d \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/lwip-2.1/porting/src/lwip_init.d \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/lwip-2.1/porting/src/netdb_porting.d \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/lwip-2.1/porting/src/sockets_porting.d \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/lwip-2.1/porting/src/sys_arch.d 

OBJS += \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/lwip-2.1/porting/src/driverif.o \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/lwip-2.1/porting/src/lwip_init.o \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/lwip-2.1/porting/src/netdb_porting.o \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/lwip-2.1/porting/src/sockets_porting.o \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/lwip-2.1/porting/src/sys_arch.o 

DIR_OBJS += \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/lwip-2.1/porting/src/*.o \

DIR_DEPS += \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/lwip-2.1/porting/src/*.d \

DIR_EXPANDS += \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/lwip-2.1/porting/src/*.253r.expand \


# Each subdirectory must supply rules for building sources it contributes
.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/lwip-2.1/porting/src/%.o: ../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/lwip-2.1/porting/src/%.c
	@	riscv-wch-elf-gcc -march=rv32imafcxw -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -fsingle-precision-constant -Wunused -Wuninitialized -g -I"/home/alarm/mounriver-studio-projects/testCH32V305/Debug" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Core" -I"/home/alarm/mounriver-studio-projects/testCH32V305/User" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Peripheral/inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"

