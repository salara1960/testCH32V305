################################################################################
# MRS Version: 2.3.0
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../DOC/EXAM/ETH/MQTT/MQTT/MQTTConnectClient.c \
../DOC/EXAM/ETH/MQTT/MQTT/MQTTDeserializePublish.c \
../DOC/EXAM/ETH/MQTT/MQTT/MQTTFormat.c \
../DOC/EXAM/ETH/MQTT/MQTT/MQTTPacket.c \
../DOC/EXAM/ETH/MQTT/MQTT/MQTTSerializePublish.c \
../DOC/EXAM/ETH/MQTT/MQTT/MQTTSubscribeClient.c \
../DOC/EXAM/ETH/MQTT/MQTT/MQTTUnsubscribeClient.c 

C_DEPS += \
./DOC/EXAM/ETH/MQTT/MQTT/MQTTConnectClient.d \
./DOC/EXAM/ETH/MQTT/MQTT/MQTTDeserializePublish.d \
./DOC/EXAM/ETH/MQTT/MQTT/MQTTFormat.d \
./DOC/EXAM/ETH/MQTT/MQTT/MQTTPacket.d \
./DOC/EXAM/ETH/MQTT/MQTT/MQTTSerializePublish.d \
./DOC/EXAM/ETH/MQTT/MQTT/MQTTSubscribeClient.d \
./DOC/EXAM/ETH/MQTT/MQTT/MQTTUnsubscribeClient.d 

OBJS += \
./DOC/EXAM/ETH/MQTT/MQTT/MQTTConnectClient.o \
./DOC/EXAM/ETH/MQTT/MQTT/MQTTDeserializePublish.o \
./DOC/EXAM/ETH/MQTT/MQTT/MQTTFormat.o \
./DOC/EXAM/ETH/MQTT/MQTT/MQTTPacket.o \
./DOC/EXAM/ETH/MQTT/MQTT/MQTTSerializePublish.o \
./DOC/EXAM/ETH/MQTT/MQTT/MQTTSubscribeClient.o \
./DOC/EXAM/ETH/MQTT/MQTT/MQTTUnsubscribeClient.o 

DIR_OBJS += \
./DOC/EXAM/ETH/MQTT/MQTT/*.o \

DIR_DEPS += \
./DOC/EXAM/ETH/MQTT/MQTT/*.d \

DIR_EXPANDS += \
./DOC/EXAM/ETH/MQTT/MQTT/*.253r.expand \


# Each subdirectory must supply rules for building sources it contributes
DOC/EXAM/ETH/MQTT/MQTT/%.o: ../DOC/EXAM/ETH/MQTT/MQTT/%.c
	@	riscv-wch-elf-gcc -march=rv32imafcxw -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -fsingle-precision-constant -Wunused -Wuninitialized -g -I"/home/alarm/mounriver-studio-projects/testCH32V305/Debug" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Core" -I"/home/alarm/mounriver-studio-projects/testCH32V305/User" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Peripheral/inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"

