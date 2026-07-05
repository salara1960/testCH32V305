################################################################################
# MRS Version: 2.5.0
# Automatically-generated file. Do not edit!
################################################################################
-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include User/subdir.mk
-include Startup/subdir.mk
-include Peripheral/src/subdir.mk
-include Debug/subdir.mk
-include Core/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(S_DEPS)),)
-include $(S_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(ASM_DEPS)),)
-include $(ASM_DEPS)
endif
ifneq ($(strip $(ASM_UPPER_DEPS)),)
-include $(ASM_UPPER_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 
SECONDARY_FLASH += \
testCH32V305.bin \
testCH32V305.hex \


# All Target
all: 
	$(MAKE) --no-print-directory main-build 
	$(MAKE) --no-print-directory post-build 

main-build: testCH32V305.elf secondary-outputs

post-build: 
	ls -ls testCH32V305.*

# Tool invocations
testCH32V305.elf: $(OBJS) $(USER_OBJS_ESCAPE)
	@	riscv-wch-elf-gcc -march=rv32imafc_xw -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -fsingle-precision-constant -Wunused -Wuninitialized -g -T "/home/alarm/mounriver-studio-projects/testCH32V305/Ld/Link.ld" -nostartfiles -Xlinker --gc-sections -Wl,-Map,"testCH32V305.map" --specs=nano.specs --specs=nosys.specs -v -o "testCH32V305.elf" $(OBJS) $(LIBS)
testCH32V305.bin: testCH32V305.elf
	@	riscv-wch-elf-objcopy -O binary "testCH32V305.elf" "testCH32V305.bin"
testCH32V305.hex: testCH32V305.elf
	@	riscv-wch-elf-objcopy -O ihex "testCH32V305.elf" "testCH32V305.hex"

# Other Targets
clean:
	-$(RM) $(DIR_OBJS) $(SECONDARY_FLASH) testCH32V305.elf
	-$(RM) $(DIR_EXPANDS) $(CALLGRAPH_DOT)
	-$(RM) $(DIR_DEPS)
secondary-outputs: $(SECONDARY_FLASH)

.PHONY: all clean dependents

-include ../makefile.targets