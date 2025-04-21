PF = 20
PC = 24.95
IMP = 0.23
SPA = 0.20

Lucro = ((PC - SPA) / (1 + IMP)) - PF

Impostos = 500 * PC * IMP

exemplares = 500 * Lucro

print("Para uma tiragem de 500 exemplares, a livraria teria um lucro de {}€ e {}€ de impostos".format(exemplares, Impostos))


