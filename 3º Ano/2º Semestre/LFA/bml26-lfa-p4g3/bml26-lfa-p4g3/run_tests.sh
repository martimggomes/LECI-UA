#!/bin/bash

# Configuração de Caminhos
SRC_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SRC_DIR" || exit 1 # Garante que o script corre na pasta raiz do projeto

MIN_DIR="$SRC_DIR/examples/min"
DES_DIR="$SRC_DIR/examples/des"
ADV_DIR="$SRC_DIR/examples/adv" # Pasta dedicada para avançados, se existir
BEC_DIR="$SRC_DIR/src/bec"
BML_JAVA_DIR="$SRC_DIR/src/bml26"

INCLUDES="-I/usr/local/include/antlr4-runtime"
LIBS="-lantlr4-runtime"
BINARY="$SRC_DIR/programa_final"

echo ">>> A iniciar limpeza e build..."
chmod +x clean.sh build.sh
./clean.sh
./build.sh
if [ $? -ne 0 ]; then
    echo -e "\033[0;31mErro durante o build. Abortando testes.\033[0m"
    exit 1
fi

# --- Procura inteligente do ANTLR 4.9.3 ---
ANTLR_PATHS=(
    "$SRC_DIR/antlr-4.9.3-complete.jar"
    "/usr/local/lib/antlr-4.9.3-complete.jar"
    "/usr/local/antlr-4.9.3-complete.jar"
    "$HOME/antlr-4.9.3-complete.jar"
)

for path in "${ANTLR_PATHS[@]}"; do
    if [ -f "$path" ]; then ANTLR_JAR="$path"; break; fi
done

if [ -z "$ANTLR_JAR" ]; then
    echo -e "\033[0;31mERRO: Ficheiro 'antlr-4.9.3-complete.jar' não encontrado!\033[0m"
    exit 1
fi

# --- Procura inteligente do StringTemplate 4 ---
ST_JAR=""
ST_PATHS=(
    "/usr/local/lib/ST-4.3.4.jar"
    "/usr/share/java/stringtemplate4.jar"
    "$SRC_DIR/ST-4.3.4.jar"
)
for path in "${ST_PATHS[@]}"; do
    if [ -f "$path" ]; then ST_JAR="$path"; break; fi
done

if [ -z "$ST_JAR" ]; then
    echo -e "\033[0;31mAVISO: ST-4.3.4.jar não encontrado. A usar caminho padrão...\033[0m"
    ST_JAR="/usr/local/lib/ST-4.3.4.jar"
fi

CLASSPATH="$ANTLR_JAR:$ST_JAR:$BML_JAVA_DIR"

# Cores
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

# --- Gera o .cpp a partir do .bml ---
generate_cpp() {
    local BML_FILE="$1"
    local TEST_NAME=$(basename "$BML_FILE" .bml)
    local CPP_FILE="$SRC_DIR/$TEST_NAME.cpp"

    java -cp "$CLASSPATH" bml26Main "$BML_FILE" 2>/tmp/bml26_err
    if [ $? -ne 0 ] || [ ! -f "$CPP_FILE" ]; then
        echo -e "  ${RED}✗ Erro ao gerar C++ a partir de $(basename "$BML_FILE"):${NC}"
        cat /tmp/bml26_err
        return 1
    fi
    return 0
}

# --- Corre um teste ---
run_test() {
    local BML_FILE="$1"
    local TEST_NAME=$(basename "$BML_FILE" .bml)
    local CPP_FILE="$SRC_DIR/$TEST_NAME.cpp"

    echo -e "\n${YELLOW}▶ $TEST_NAME${NC}"

    generate_cpp "$BML_FILE"
    if [ $? -ne 0 ]; then return 1; fi

    # Adicionado -Wall e -Wconversion para capturar erros de tipos (como o bug do 4294967266)
    g++ -std=c++17 "$CPP_FILE" "$BEC_DIR"/*.cpp \
        $INCLUDES -I"$BEC_DIR" -I"$SRC_DIR" $LIBS \
        -Wall -Wconversion -o "$BINARY" 2>/tmp/bml_err
    if [ $? -ne 0 ]; then
        echo -e "  ${RED}✗ Erro de compilação C++:${NC}"
        cat /tmp/bml_err
        return 1
    fi

    "$BINARY"
    if [ $? -eq 0 ]; then
        echo -e "  ${GREEN}✓ OK${NC}"
        rm -f "$BINARY" "$CPP_FILE"
        return 0
    else
        echo -e "  ${RED}✗ Falhou${NC}"
        rm -f "$BINARY" "$CPP_FILE"
        return 1
    fi
}

# --- Runner de Listas ---
run_list() {
    local -n arr=$1
    local TITLE=$2
    local PASS=0
    local FAIL=0

    echo -e "\n${YELLOW}======================================================================================================${NC}"
    echo -e "${YELLOW}  BML26 Test Runner — $TITLE${NC}"
    echo -e "${YELLOW}========================================================================================================${NC}"

    for BML_FILE in "${arr[@]}"; do
        run_test "$BML_FILE"
        if [ $? -eq 0 ]; then ((PASS++)); else ((FAIL++)); fi
    done

    echo -e "\n${YELLOW}======================================================================================================${NC}"
    echo -e "  Resultados ($TITLE): ${GREEN}$PASS passou${NC} | ${RED}$FAIL falhou${NC}"
    echo -e "${YELLOW}========================================================================================================${NC}"
}

# --- Coletar Testes ---
MIN_TESTS=($(ls "$MIN_DIR"/min-*.bml 2>/dev/null | sort))
DES_TESTS=($(ls "$DES_DIR"/des-*.bml 2>/dev/null | sort))
# Procura avançados em ambas as pastas e aceita prefixos 'adv-' ou 'advanced-'
ADV_TESTS=($(ls "$DES_DIR"/advanced-*.bml "$DES_DIR"/adv-*.bml "$ADV_DIR"/*.bml 2>/dev/null | sort))
ALL_TESTS=("${MIN_TESTS[@]}" "${DES_TESTS[@]}" "${ADV_TESTS[@]}")

# --- Construção Dinâmica do Menu ---
echo -e "\n${CYAN}=========================================== Menu de Testes BML26 ===========================================${NC}"
echo "0. Todos (Mínimos, Desejáveis e Avançados)"

INDEX=1
declare -a MENU_MAP
echo -e "\n${CYAN}--- Testes Mínimos ---${NC}"

for test in "${MIN_TESTS[@]}"; do
    name=$(basename "$test" .bml)
    echo "$INDEX. $name"
    MENU_MAP[$INDEX]="$test"
    ((INDEX++))
done
MIN_ALL_IDX=$INDEX
echo "$MIN_ALL_IDX. Todos os minimos"
((INDEX++))

echo -e "\n${CYAN}--- Testes Desejáveis ---${NC}"
for test in "${DES_TESTS[@]}"; do
    name=$(basename "$test" .bml)
    echo "$INDEX. $name"
    MENU_MAP[$INDEX]="$test"
    ((INDEX++))
done
DES_ALL_IDX=$INDEX
echo "$DES_ALL_IDX. Todos os desejaveis"
((INDEX++))

echo -e "\n${CYAN}--- Testes Avançados ---${NC}"
for test in "${ADV_TESTS[@]}"; do
    name=$(basename "$test" .bml)
    echo "$INDEX. $name"
    MENU_MAP[$INDEX]="$test"
    ((INDEX++))
done
ADV_ALL_IDX=$INDEX
echo "$ADV_ALL_IDX. Todos os avançados"
((INDEX++))

echo -e "${CYAN}================================================================================================================${NC}"
echo -n "Escolha uma opção: "
read -r OPTION

if [[ "$OPTION" -eq 0 ]]; then
    run_list ALL_TESTS "Todos (Minimos, Desejaveis e Avançados)"
elif [[ "$OPTION" -eq "$MIN_ALL_IDX" ]]; then
    run_list MIN_TESTS "Todos os Minimos"
elif [[ "$OPTION" -eq "$DES_ALL_IDX" ]]; then
    run_list DES_TESTS "Todos os Desejaveis"
elif [[ "$OPTION" -eq "$ADV_ALL_IDX" ]]; then
    run_list ADV_TESTS "Todos os Avançados"
else
    SELECTED_TEST="${MENU_MAP[$OPTION]}"
    if [ -n "$SELECTED_TEST" ]; then
        run_test "$SELECTED_TEST"
    else
        echo -e "${RED}Opção inválida!${NC}"
    fi
fi