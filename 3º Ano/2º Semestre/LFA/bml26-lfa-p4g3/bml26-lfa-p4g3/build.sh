#!/bin/bash

# Definir o caminho para o JAR do ANTLR 4.9.3
# Procurar em locais padrão do sistema e locais comuns de instalação
POSSIBLE_PATHS=(
    "$(pwd)/antlr-4.9.3-complete.jar"
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

echo ">>> 1. A preparar o compilador BML26 (Java)..."
cd src/bml26
# Gerar código Java e compilar usando explicitamente o JAR 4.9.3
java -jar "$ANTLR_JAR" -visitor bml26.g4
javac -cp ".:$ANTLR_JAR" *.java
cd ../..

echo ">>> 2. A preparar o interpretador BEC (C++)..."
cd src/bec
echo "    -> A usar ANTLR 4.9.3 ($ANTLR_JAR) para C++..."
# Forçar a geração de código C++ compatível com o runtime 4.9
java -jar "$ANTLR_JAR" -Dlanguage=Cpp -no-listener -visitor bec.g4
cd ../..

echo ">>> Build concluído com sucesso!"