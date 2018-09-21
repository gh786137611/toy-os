$(BIN_DIR)/system.bin : $(OBJ_DIR)/system.o system.lds $(OBJ_DIR)/main.o
	ld --oformat binary -m elf_i386 -o $(BIN_DIR)/system.bin $(OBJ_DIR)/system.o $(OBJ_DIR)/main.o -T system.lds

$(OBJ_DIR)/main.o: main.c
	$(CC) $(CFLAGS) -c main.c -o $(OBJ_DIR)/main.o
	
$(OBJ_DIR)/system.o : system.s
	as --32 system.s -o $(OBJ_DIR)/system.o 
