# Définir le compilateur croisé
CC = arm-none-eabi-gcc

# Définir les options de compilation
CFLAGS = -mcpu=cortex-m3 -mthumb -Wall -g

# Définir les fichiers objets
OBJ = SWC.o TestProtocol.o

# Définir la cible
TARGET = my_proj.bin

# Règles de compilation
all: $(TARGET)

$(TARGET): $(OBJ)
	$(CC) $(CFLAGS) -o $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

test:
    # Ajoutez ici les commandes pour exécuter les tests/unités
    # Par exemple :
    ./TestProtocol.exe

clean:
	rm -f $(OBJ) $(TARGET)
