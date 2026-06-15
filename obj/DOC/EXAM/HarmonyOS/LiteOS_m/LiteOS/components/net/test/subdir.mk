################################################################################
# MRS Version: 2.3.0
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_001.c \
../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_002.c \
../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_003.c \
../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_004.c \
../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_005.c \
../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_006.c \
../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_007.c \
../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_008.c \
../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_009.c \
../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_010.c \
../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_011.c \
../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_012.c \
../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_013.c \
../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/test_main.c 

C_DEPS += \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_001.d \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_002.d \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_003.d \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_004.d \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_005.d \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_006.d \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_007.d \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_008.d \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_009.d \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_010.d \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_011.d \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_012.d \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_013.d \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/test_main.d 

OBJS += \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_001.o \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_002.o \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_003.o \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_004.o \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_005.o \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_006.o \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_007.o \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_008.o \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_009.o \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_010.o \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_011.o \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_012.o \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/net_socket_test_013.o \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/test_main.o 

DIR_OBJS += \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/*.o \

DIR_DEPS += \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/*.d \

DIR_EXPANDS += \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/*.253r.expand \


# Each subdirectory must supply rules for building sources it contributes
DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/%.o: ../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/components/net/test/%.c
	@	riscv-wch-elf-gcc -march=rv32imafcxw -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -fsingle-precision-constant -Wunused -Wuninitialized -g -I"/home/alarm/mounriver-studio-projects/testCH32V305/Debug" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Core" -I"/home/alarm/mounriver-studio-projects/testCH32V305/User" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Peripheral/inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"

