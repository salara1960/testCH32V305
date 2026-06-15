################################################################################
# MRS Version: 2.3.0
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_001.c \
../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_002.c \
../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_003.c \
../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_004.c \
../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_005.c \
../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_006.c \
../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_007.c \
../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_008.c \
../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_009.c \
../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_010.c \
../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_011.c \
../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_012.c \
../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_013.c \
../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/test_main.c 

C_DEPS += \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_001.d \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_002.d \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_003.d \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_004.d \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_005.d \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_006.d \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_007.d \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_008.d \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_009.d \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_010.d \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_011.d \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_012.d \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_013.d \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/test_main.d 

OBJS += \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_001.o \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_002.o \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_003.o \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_004.o \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_005.o \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_006.o \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_007.o \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_008.o \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_009.o \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_010.o \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_011.o \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_012.o \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_013.o \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/test_main.o 

DIR_OBJS += \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/*.o \

DIR_DEPS += \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/*.d \

DIR_EXPANDS += \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/*.253r.expand \


# Each subdirectory must supply rules for building sources it contributes
.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/%.o: ../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/%.c
	@	riscv-wch-elf-gcc -march=rv32imafcxw -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -fsingle-precision-constant -Wunused -Wuninitialized -g -I"/home/alarm/mounriver-studio-projects/testCH32V305/Debug" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Core" -I"/home/alarm/mounriver-studio-projects/testCH32V305/User" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Peripheral/inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"

