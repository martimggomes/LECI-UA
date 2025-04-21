def notas(*n, sit=False):
    r = dict()
    r['Total'] = len(n)
    r['Maior'] = max(n)
    r['Menor'] = min(n)
    r['Média'] = sum(n) / len(n)
    if sit:
        if r['Média'] >= 9.5:
            r['Situação'] = "Aprovado"
        else:
            r['Situação'] = "Reprovado"

    return r


resp = notas(9.5, 2.5, 8, 18.3, sit=True)        
print(resp)