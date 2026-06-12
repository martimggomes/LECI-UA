#!/bin/bash

if [ "$#" -eq 0 ]; then
    if [ -f .last_exec ]; then
        EXEC_NAME=$(cat .last_exec)
    else
        echo "Erro: Nenhum executável recente encontrado. Usa o compile.sh primeiro."
        exit 1
    fi
else
    EXEC_NAME=$1
fi

if [ ! -f "$EXEC_NAME" ]; then
    echo "Erro: O executável '$EXEC_NAME' não existe."
    exit 1
fi

echo " A EXECUTAR: $EXEC_NAME"
./$EXEC_NAME