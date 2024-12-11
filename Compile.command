#!/bin/bash
#!/bin/bash

# Ruta del proyecto
PROJECT_DIR="/Users/adririhacker/Desktop/Escape from the Dark Office"
SRC_DIR="$PROJECT_DIR/src"
BUILD_DIR="$PROJECT_DIR/build"

# Crear la carpeta de compilación si no existe
if [ ! -d "$BUILD_DIR" ]; then
    echo "Creando carpeta de compilación..."
    mkdir -p "$BUILD_DIR"
fi

# Moverse a la carpeta de compilación
cd "$BUILD_DIR" || exit 1

# Compilar el código
echo "Compilando el juego..."
g++ -std=c++17 -I"$PROJECT_DIR/include" -o EscapeGame "$SRC_DIR/main.cpp" "$SRC_DIR/Game.cpp" "$SRC_DIR/Player.cpp" "$SRC_DIR/Boss.cpp" "$SRC_DIR/Puzzle.cpp" "$SRC_DIR/Dialogues.cpp" "$SRC_DIR/Scene.cpp" "$SRC_DIR/Inventory.cpp" "$SRC_DIR/AudioManager.cpp" -lsfml-graphics -lsfml-window -lsfml-system

# Verificar si la compilación fue exitosa
if [ $? -eq 0 ]; then
    echo "Compilación exitosa. Ejecutando el juego..."
    ./EscapeGame
else
    echo "Error en la compilación."
    exit 1
fi