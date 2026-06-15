################################################################################
# MRS Version: 2.3.0
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/stdlib/atoi_test.c \
../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/stdlib/atol_test.c \
../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/stdlib/atoll_test.c \
../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/stdlib/strtol_test.c \
../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/stdlib/strtoul_test.c \
../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/stdlib/strtoull_test.c 

C_DEPS += \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/stdlib/atoi_test.d \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/stdlib/atol_test.d \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/stdlib/atoll_test.d \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/stdlib/strtol_test.d \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/stdlib/strtoul_test.d \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/stdlib/strtoull_test.d 

OBJS += \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/stdlib/atoi_test.o \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/stdlib/atol_test.o \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/stdlib/atoll_test.o \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/stdlib/strtol_test.o \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/stdlib/strtoul_test.o \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/stdlib/strtoull_test.o 

DIR_OBJS += \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/stdlib/*.o \

DIR_DEPS += \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/stdlib/*.d \

DIR_EXPANDS += \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/stdlib/*.253r.expand \


# Each subdirectory must supply rules for building sources it contributes
DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/stdlib/%.o: ../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/stdlib/%.c
	@	riscv-wch-elf-gcc -march=rv32imafcxw -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -fsingle-precision-constant -Wunused -Wuninitialized -g -I"/home/alarm/mounriver-studio-projects/testCH32V305/Debug" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Core" -I"/home/alarm/mounriver-studio-projects/testCH32V305/User" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Peripheral/inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"

