################################################################################
# MRS Version: 2.3.0
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../.doc/DOC/EXAM/ETH/MQTT/MQTT/MQTTConnectClient.c \
../.doc/DOC/EXAM/ETH/MQTT/MQTT/MQTTDeserializePublish.c \
../.doc/DOC/EXAM/ETH/MQTT/MQTT/MQTTFormat.c \
../.doc/DOC/EXAM/ETH/MQTT/MQTT/MQTTPacket.c \
../.doc/DOC/EXAM/ETH/MQTT/MQTT/MQTTSerializePublish.c \
../.doc/DOC/EXAM/ETH/MQTT/MQTT/MQTTSubscribeClient.c \
../.doc/DOC/EXAM/ETH/MQTT/MQTT/MQTTUnsubscribeClient.c 

C_DEPS += \
./.doc/DOC/EXAM/ETH/MQTT/MQTT/MQTTConnectClient.d \
./.doc/DOC/EXAM/ETH/MQTT/MQTT/MQTTDeserializePublish.d \
./.doc/DOC/EXAM/ETH/MQTT/MQTT/MQTTFormat.d \
./.doc/DOC/EXAM/ETH/MQTT/MQTT/MQTTPacket.d \
./.doc/DOC/EXAM/ETH/MQTT/MQTT/MQTTSerializePublish.d \
./.doc/DOC/EXAM/ETH/MQTT/MQTT/MQTTSubscribeClient.d \
./.doc/DOC/EXAM/ETH/MQTT/MQTT/MQTTUnsubscribeClient.d 

OBJS += \
./.doc/DOC/EXAM/ETH/MQTT/MQTT/MQTTConnectClient.o \
./.doc/DOC/EXAM/ETH/MQTT/MQTT/MQTTDeserializePublish.o \
./.doc/DOC/EXAM/ETH/MQTT/MQTT/MQTTFormat.o \
./.doc/DOC/EXAM/ETH/MQTT/MQTT/MQTTPacket.o \
./.doc/DOC/EXAM/ETH/MQTT/MQTT/MQTTSerializePublish.o \
./.doc/DOC/EXAM/ETH/MQTT/MQTT/MQTTSubscribeClient.o \
./.doc/DOC/EXAM/ETH/MQTT/MQTT/MQTTUnsubscribeClient.o 

DIR_OBJS += \
./.doc/DOC/EXAM/ETH/MQTT/MQTT/*.o \

DIR_DEPS += \
./.doc/DOC/EXAM/ETH/MQTT/MQTT/*.d \

DIR_EXPANDS += \
./.doc/DOC/EXAM/ETH/MQTT/MQTT/*.253r.expand \


# Each subdirectory must supply rules for building sources it contributes
.doc/DOC/EXAM/ETH/MQTT/MQTT/%.o: ../.doc/DOC/EXAM/ETH/MQTT/MQTT/%.c
	@	riscv-wch-elf-gcc -march=rv32imafcxw -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -fsingle-precision-constant -Wunused -Wuninitialized -g -I"/home/alarm/mounriver-studio-projects/testCH32V305/Debug" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Core" -I"/home/alarm/mounriver-studio-projects/testCH32V305/User" -I"/home/alarm/mounriver-studio-projects/testCH32V305/Peripheral/inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"

