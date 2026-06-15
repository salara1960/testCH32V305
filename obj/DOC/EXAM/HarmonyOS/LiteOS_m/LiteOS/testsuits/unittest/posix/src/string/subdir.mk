################################################################################
# MRS Version: 2.3.0
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/string/memory_func_test.c \
../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/string/strchr_test.c \
../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/string/string_func_test_01.c \
../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/string/string_func_test_02.c \
../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/string/string_func_test_03.c \
../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/string/strstr_test.c 

C_DEPS += \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/string/memory_func_test.d \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/string/strchr_test.d \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/string/string_func_test_01.d \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/string/string_func_test_02.d \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/string/string_func_test_03.d \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/string/strstr_test.d 

OBJS += \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/string/memory_func_test.o \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/string/strchr_test.o \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/string/string_func_test_01.o \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/string/string_func_test_02.o \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/string/string_func_test_03.o \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/string/strstr_test.o 

DIR_OBJS += \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/string/*.o \

DIR_DEPS += \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/string/*.d \

DIR_EXPANDS += \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/string/*.253r.expand \


# Each subdirectory must supply rules for building sources it contributes
DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/string/%.o: ../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/string/%.c
	@	riscv-wch-elf-gcc -march=rv32imafcxw -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -fsingle-precision-constant -Wunused -Wuninitialized -g -I"/home/alarm/mounriver-studio-projects/testCH32V305/Debug" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Core" -I"/home/alarm/mounriver-studio-projects/testCH32V305/User" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Peripheral/inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"

