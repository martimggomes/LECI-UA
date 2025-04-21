def subsequences(nums):
    # Função recursiva auxiliar
    def _subsequences(index, current):
        # Caso base: se chegamos ao final da lista, adicionamos a subsequência atual ao resultado
        if index == len(nums):
            result.append(current[:])  # Adiciona uma cópia da subsequência atual
            return
        
        # Opção 1: Não incluir o número atual na subsequência
        _subsequences(index + 1, current)
        
        # Opção 2: Incluir o número atual na subsequência
        current.append(nums[index])
        _subsequences(index + 1, current)
        
        # Reverter a escolha para outras chamadas recursivas
        current.pop()

    result = []
    _subsequences(0, [])
    return result

# Exemplo de uso:
print(subsequences([1, 2, 3]))
