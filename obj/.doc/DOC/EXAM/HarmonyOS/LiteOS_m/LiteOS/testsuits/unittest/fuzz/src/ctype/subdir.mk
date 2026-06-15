################################################################################
# MRS Version: 2.3.0
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/ctype/isdigit_fuzz.c \
../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/ctype/islower_fuzz.c \
../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/ctype/isxdigit_fuzz.c \
../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/ctype/test_isalnum_fuzz.c \
../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/ctype/test_isascii_fuzz.c \
../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/ctype/test_isprint_fuzz.c \
../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/ctype/test_isspace_fuzz.c \
../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/ctype/test_isupper_fuzz.c \
../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/ctype/tolower_fuzz.c \
../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/ctype/toupper_fuzz.c 

C_DEPS += \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/ctype/isdigit_fuzz.d \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/ctype/islower_fuzz.d \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/ctype/isxdigit_fuzz.d \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/ctype/test_isalnum_fuzz.d \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/ctype/test_isascii_fuzz.d \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/ctype/test_isprint_fuzz.d \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/ctype/test_isspace_fuzz.d \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/ctype/test_isupper_fuzz.d \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/ctype/tolower_fuzz.d \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/ctype/toupper_fuzz.d 

OBJS += \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/ctype/isdigit_fuzz.o \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/ctype/islower_fuzz.o \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/ctype/isxdigit_fuzz.o \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/ctype/test_isalnum_fuzz.o \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/ctype/test_isascii_fuzz.o \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/ctype/test_isprint_fuzz.o \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/ctype/test_isspace_fuzz.o \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/ctype/test_isupper_fuzz.o \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/ctype/tolower_fuzz.o \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/ctype/toupper_fuzz.o 

DIR_OBJS += \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/ctype/*.o \

DIR_DEPS += \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/ctype/*.d \

DIR_EXPANDS += \
./.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/ctype/*.253r.expand \


# Each subdirectory must supply rules for building sources it contributes
.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/ctype/%.o: ../.doc/DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/ctype/%.c
	@	riscv-wch-elf-gcc -march=rv32imafcxw -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -fsingle-precision-constant -Wunused -Wuninitialized -g -I"/home/alarm/mounriver-studio-projects/testCH32V305/Debug" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Core" -I"/home/alarm/mounriver-studio-projects/testCH32V305/User" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Peripheral/inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"

