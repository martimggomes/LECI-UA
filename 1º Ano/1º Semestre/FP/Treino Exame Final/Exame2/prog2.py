# Dicionário de exemplo com as estradas entre cidades e suas respectivas distâncias
roads = {
    ('Aveiro', 'Coimbra'): 65,
    ('Coimbra', 'Viseu'): 91,
    ('Agueda', 'Aveiro'): 35,
    ('Agueda', 'Porto'): 78,
    ('Figueira', 'Viseu'): 78,
    ('Evora', 'Beja'): 105,
    ('Faro', 'Lisboa'): 278,
    ('Lisboa', 'Porto'): 313,
    ('Agueda', 'Coimbra'): 45,
    ('Coimbra', 'Leiria'): 70,
    ('Leiria', 'Santarem'): 63,
    ('Santarem', 'Lisboa'): 100

}

# a) Função distance
def distance(roads, c1, c2):
    if c1 == c2:
        return 0
    elif (c1,c2) in roads:
        return roads[(c1, c2)]
    elif (c2,c1) in roads:
        return roads[(c2, c1)]
    else: 
        return None

# b) Função travelDistance
def travelDistance(roads, t):
    total_distance = 0
    for i in range(len(t)):
        for j in range(i + 1, len(t)):
            d = distance(roads, t[i], t[j])
            if d is not None:
                total_distance += d
    return total_distance if total_distance > 0 else None

# c) Função neighbors
def neighbors(roads):
    neighbor_dict = {}
    for c1, c2 in roads.keys():
        if c1 not in neighbor_dict:
            neighbor_dict[c1] = {}
        if c2 not in neighbor_dict:
            neighbor_dict[c2] = {}
        neighbor_dict[c1][c2] = roads[(c1, c2)]
        neighbor_dict[c2][c1] = roads[(c1, c2)]
    return neighbor_dict

# Código de teste

# Testando a função distance
print(distance(roads, 'Aveiro', 'Coimbra'))  # Deve retornar 65
print(distance(roads, 'Coimbra', 'Aveiro'))  # Deve retornar 65
print(distance(roads, 'Braga', 'Aveiro'))    # Deve retornar None
print()
# Testando a função travelDistance
print(travelDistance(roads, ['Agueda', 'Aveiro', 'Porto']))  # Deve retornar 113
print(travelDistance(roads, ['Aveiro', 'Agueda', 'Coimbra', 'Aveiro']))  # Deve retornar 156
print(travelDistance(roads, ['Aveiro', 'Coimbra', 'Leiria', 'Santarem', 'Lisboa']))  # Deve retornar None

# Testando a função neighbors
print(neighbors(roads))
