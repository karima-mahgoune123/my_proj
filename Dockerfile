# Utiliser une image de base appropriée pour la compilation croisée
FROM ubuntu:latest

# Installer les outils nécessaires
RUN apt-get update && apt-get install -y \
    gcc-arm-none-eabi \
    binutils-arm-none-eabi \
    make \
    cmake

# Définir le répertoire de travail
WORKDIR /Users/HP/my_proj

# Copier les fichiers source dans le conteneur
COPY SWC.c TestProtocol.c

# Compiler les fichiers source pour le microcontrôleur
RUN make

# La commande par défaut peut être laissée vide ou utilisée pour lancer des tests/unités
CMD ["/bin/bash"]
