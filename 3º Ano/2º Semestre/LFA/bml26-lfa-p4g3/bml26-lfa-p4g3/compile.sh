#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Erro: Ficheiro fonte não especificado."
    echo "Uso: ./compile.sh <caminho_para_ficheiro.bml>"
    exit 1
fi

SOURCE_FILE=$1
ABS_SOURCE=$(readlink -f "$SOURCE_FILE")
BASENAME=$(basename "$SOURCE_FILE" .bml)
EXEC_NAME="${BASENAME}_run"

# O tradutor Java precisa do runtime do ANTLR para correr.
POSSIBLE_PATHS=(
    "$(readlink -f antlr-4.9.3-complete.jar)"
    "/usr/local/lib/antlr-4.9.3-complete.jar"
    "/usr/local/antlr-4.9.3-complete.jar"
    "$HOME/antlr-4.9.3-complete.jar"
)

ANTLR_JAR=""
for path in "${POSSIBLE_PATHS[@]}"; do
    if [ -f "$path" ]; then
        ANTLR_JAR="$path"
        break
    fi
done

if [ -z "$ANTLR_JAR" ]; then
    echo "Erro: Ficheiro antlr-4.9.3-complete.jar não encontrado."
    exit 1
fi

echo ">>> A traduzir $SOURCE_FILE para C++..."
cd src/bml26
# Adicionamos o JAR ao classpath para a execução
java -cp ".:$ANTLR_JAR" bml26Main "$ABS_SOURCE"

echo ">>> A compilar o executável nativo (C++)..."
g++ -std=c++17 -pthread ${BASENAME}.cpp ../bec/*.cpp -I/usr/local/include/antlr4-runtime -lantlr4-runtime -o "../../$EXEC_NAME"
cd ../..

echo "$EXEC_NAME" > .last_exec
echo ">>> Concluído! O executável gerado chama-se: $EXEC_NAME"