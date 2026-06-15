################################################################################
# MRS Version: 2.3.0
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/stdio/clearerr_fuzz.c \
../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/stdio/feof_fuzz.c \
../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/stdio/perror_fuzz.c 

C_DEPS += \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/stdio/clearerr_fuzz.d \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/stdio/feof_fuzz.d \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/stdio/perror_fuzz.d 

OBJS += \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/stdio/clearerr_fuzz.o \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/stdio/feof_fuzz.o \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/stdio/perror_fuzz.o 

DIR_OBJS += \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/stdio/*.o \

DIR_DEPS += \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/stdio/*.d \

DIR_EXPANDS += \
./DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/stdio/*.253r.expand \


# Each subdirectory must supply rules for building sources it contributes
DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/stdio/%.o: ../DOC/EXAM/HarmonyOS/LiteOS_m/LiteOS/testsuits/unittest/fuzz/src/stdio/%.c
	@	riscv-wch-elf-gcc -march=rv32imafcxw -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -fsingle-precision-constant -Wunused -Wuninitialized -g -I"/home/alarm/mounriver-studio-projects/testCH32V305/Debug" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Core" -I"/home/alarm/mounriver-studio-projects/testCH32V305/User" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Peripheral/inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"

