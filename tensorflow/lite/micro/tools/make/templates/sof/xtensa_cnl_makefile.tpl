
TARGET_TOOLCHAIN_PREFIX := xtensa-cnl-elf

CC = ${TARGET_TOOLCHAIN_PREFIX}-cc
CXX = ${TARGET_TOOLCHAIN_PREFIX}-c++
LD = ${TARGET_TOOLCHAIN_PREFIX}-ld
AS = ${TARGET_TOOLCHAIN_PREFIX}-as
AR = ${TARGET_TOOLCHAIN_PREFIX}-ar

TARGET_TOOL_DIR = /home/lrg/work/sof/xtensa-cnl-elf/xtensa-cnl-elf/
TARGET_LIB_DIRS=$(TARGET_TOOL_DIR)/xtensa-cnl-elf/lib

LDFLAGS += -L $(TARGET_LIB_DIRS) -lstdc++
    

#OUT_NAME = %{EXECUTABLE}%
OUT_NAME = libmicrolite.a

CXXFLAGS += %{CXX_FLAGS}%
CCFLAGS += %{CC_FLAGS}%

#=============================================================
# Files and directories
#=============================================================
SRCS := \
%{SRCS}%

OBJS := \
$(patsubst %.cc,%.o,$(patsubst %.c,%.o,$(SRCS)))


#=============================================================
# Common rules
#=============================================================
.PHONY: all app flash clean run debug

%.o: %.cc
	$(CXX) $(CXXFLAGS) $(EXT_CFLAGS) $(INCLUDES) -c $< -o $@

%.o: %.c
	$(CC) $(CCFLAGS) $(EXT_CFLAGS) $(INCLUDES) -c $< -o $@

$(OUT_NAME): $(OBJS)
	$(AR) rc $@ $(OBJS) $(TOOLS_OBJS) ${TOOLS_LIBS}

%{EXTRA_APP_RULES}%


#=================================================================
# Global rules
#=================================================================
all: $(OUT_NAME)

app: $(OUT_NAME)

clean: 
	-@$(RM) $(call fix_platform_path,$(OBJS))
	-@$(RM) $(OUT_NAME) %{EXTRA_RM_TARGETS}%

#-nostdlib -lgcc -Wl,--no-check-sections -ucall_user_start -Wl,-static
