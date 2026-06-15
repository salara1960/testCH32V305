################################################################################
# MRS Version: 2.3.0
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/time/gmtime_fuzz.c \
../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/time/localtime_fuzz.c \
../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/time/localtime_r_fuzz.c \
../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/time/mktime_fuzz.c \
../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/time/strftime_fuzz.c \
../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/time/strptime_fuzz.c \
../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/time/time_fuzz.c 

C_DEPS += \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/time/gmtime_fuzz.d \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/time/localtime_fuzz.d \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/time/localtime_r_fuzz.d \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/time/mktime_fuzz.d \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/time/strftime_fuzz.d \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/time/strptime_fuzz.d \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/time/time_fuzz.d 

OBJS += \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/time/gmtime_fuzz.o \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/time/localtime_fuzz.o \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/time/localtime_r_fuzz.o \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/time/mktime_fuzz.o \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/time/strftime_fuzz.o \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/time/strptime_fuzz.o \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/time/time_fuzz.o 

DIR_OBJS += \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/time/*.o \

DIR_DEPS += \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/time/*.d \

DIR_EXPANDS += \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/time/*.253r.expand \


# Each subdirectory must supply rules for building sources it contributes
DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/time/%.o: ../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/time/%.c
	@	riscv-wch-elf-gcc -march=rv32imafcxw -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -fsingle-precision-constant -Wunused -Wuninitialized -g -I"/home/alarm/mounriver-studio-projects/testCH32V305/Debug" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Core" -I"/home/alarm/mounriver-studio-projects/testCH32V305/User" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Peripheral/inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"

