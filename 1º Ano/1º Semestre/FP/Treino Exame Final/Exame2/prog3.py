def permutations(s):
    if len(s) == 0:
        return ['']
    
    result = []
    
    for i, char in enumerate(s):
        sub_pernutations = permutations(s[:i] + s[i + 1:])
        
        for perm in sub_pernutations:
            result.append(char + perm)
            
    return result

# Exemplo de uso:
print(permutations('abc'))
print(permutations('abc'))
print(permutations('abcd'))
print(permutations('xy12'))
