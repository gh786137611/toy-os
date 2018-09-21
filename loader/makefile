$(BIN_DIR)/loader.bin : $(OBJ_DIR)/loader.o loader.lds
	ld --oformat binary -m elf_i386 -o $(BIN_DIR)/loader.bin $(OBJ_DIR)/loader.o -T loader.lds

$(OBJ_DIR)/loader.o : loader.s
	as --32 loader.s -o $(OBJ_DIR)/loader.o 
