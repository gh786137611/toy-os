TOP_DIR=$(abspath $(dir $(lastword $(MAKEFILE_LIST))))
OBJ_DIR = $(TOP_DIR)/obj
BIN_DIR = $(TOP_DIR)/bin

export TOP_DIR OBJ_DIR BIN_DIR

SUB_DIR= system loader


ALL: CHECKDIR $(SUB_DIR)
	echo $(TOP_DIR)


CHECKDIR:
	mkdir -p $(OBJ_DIR) $(BIN_DIR)


$(SUB_DIR): ECHO
	make -C $@

ECHO:
	@echo $(SUB_DIR)
	@echo begin compile



run : ALL
	dd if=$(BIN_DIR)/loader.bin of=$(BIN_DIR)/loader.img bs=512 count=1
	dd if=$(BIN_DIR)/system.bin of=$(BIN_DIR)/system.img bs=1474048 count=1 conv=sync
	dd if=$(BIN_DIR)/system.img of=$(BIN_DIR)/loader.img bs=512 seek=1
	qemu-system-i386 -fda $(BIN_DIR)/loader.img -boot a
clean:
	rm -rf $(OBJ_DIR) $(BIN_DIR)
