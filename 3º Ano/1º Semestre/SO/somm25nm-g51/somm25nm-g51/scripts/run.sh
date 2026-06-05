#!/bin/bash

# Verifica se recebeu parâmetro
if [ -z "$1" ]; then
    echo "Uso: $0 <numero_da_funcao>"
    exit 1
fi

FUNC="$1"

# Caminho para a main
MAIN="$(dirname "$0")/../bin/main"

# Verifica se o executável existe
if [ ! -f "$MAIN" ]; then
    echo "Erro: não encontrei o executável em $MAIN"
    exit 1
fi

# Corre comandos
"$MAIN" -b > bin.txt
"$MAIN" -b -r "${FUNC}-${FUNC}" > grp.txt

# Abre o meld
meld grp.txt bin.txt