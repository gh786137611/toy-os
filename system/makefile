$(BIN_DIR)/system.bin : $(OBJ_DIR)/system.o system.lds
	ld --oformat binary -m elf_i386 -o $(BIN_DIR)/system.bin $(OBJ_DIR)/system.o -T system.lds

$(OBJ_DIR)/system.o : system.s
	as --32 system.s -o $(OBJ_DIR)/system.o 
