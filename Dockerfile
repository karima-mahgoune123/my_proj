# Utiliser une image de base appropriée
FROM ubuntu:latest

# Installer les outils nécessaires
RUN apt-get update && apt-get install -y \
    gcc \                                  # Compilateur GCC standard
    make \                                 # Outil de construction de projets
    cmake \                                # Outil de gestion de compilation
    libcunit1 libcunit1-doc libcunit1-dev  # Bibliothèque de test unitaire et ses fichiers de développement

# Définir le répertoire de travail
WORKDIR /Users/HP/my_proj

# Copier les fichiers source dans le conteneur
COPY . .

# Compiler les fichiers source
RUN gcc -Wall -g -I/usr/include -c SWC.c -o SWC.o
RUN gcc -Wall -g -I/usr/include -c TestProtocol.c -o TestProtocol.o

# Lier les objets compilés
RUN gcc -Wall -g -o my_proj.bin SWC.o TestProtocol.o -L/usr/lib -lcunit

# Exécuter les tests/unités
CMD ["./my_proj.bin"]
