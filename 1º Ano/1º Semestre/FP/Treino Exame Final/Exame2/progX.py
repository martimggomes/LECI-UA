def parseTime(s):
    if s.isdigit():
        return int(s)
    
    elif 'h' in s:
        parts = s.split('h')
        horas = int(parts[0])
        minutos = int(parts[1]) if parts[1].isdigit() else 0
        return minutos + horas * 60
    
    #Não necessário
    elif s.endswith('h'):
        horas = int(s[:-1])
        return horas * 60
    
    else:
        return None

# Testes (não altere esta parte)
print(parseTime("45"))    # Esperado: 45
print(parseTime("3h10"))  # Esperado: 190
print(parseTime("2h"))    # Esperado: 120
print(parseTime("5h"))    # Esperado: 300
print(parseTime("abc"))   # Esperado: None
