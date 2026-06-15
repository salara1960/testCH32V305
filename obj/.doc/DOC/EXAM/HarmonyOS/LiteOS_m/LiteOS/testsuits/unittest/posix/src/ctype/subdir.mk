################################################################################
# MRS Version: 2.3.0
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/ctype/ctype_func_test.c \
../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/ctype/isdigit_test.c \
../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/ctype/islower_test.c \
../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/ctype/isxdigit_test.c \
../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/ctype/tolower_test.c \
../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/ctype/toupper_test.c 

C_DEPS += \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/ctype/ctype_func_test.d \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/ctype/isdigit_test.d \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/ctype/islower_test.d \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/ctype/isxdigit_test.d \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/ctype/tolower_test.d \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/ctype/toupper_test.d 

OBJS += \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/ctype/ctype_func_test.o \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/ctype/isdigit_test.o \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/ctype/islower_test.o \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/ctype/isxdigit_test.o \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/ctype/tolower_test.o \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/ctype/toupper_test.o 

DIR_OBJS += \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/ctype/*.o \

DIR_DEPS += \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/ctype/*.d \

DIR_EXPANDS += \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/ctype/*.253r.expand \


# Each subdirectory must supply rules for building sources it contributes
.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/ctype/%.o: ../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/posix/src/ctype/%.c
	@	riscv-wch-elf-gcc -march=rv32imafcxw -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -fsingle-precision-constant -Wunused -Wuninitialized -g -I"/home/alarm/mounriver-studio-projects/testCH32V305/Debug" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Core" -I"/home/alarm/mounriver-studio-projects/testCH32V305/User" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Peripheral/inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"

