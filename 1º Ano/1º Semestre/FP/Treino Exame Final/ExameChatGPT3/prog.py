# prog2.py

# Função para calcular a duração total da viagem e formatar a saída
def calculateTotalDuration(trip):
    total_duration = 0
    for t in trip:
        total_duration += t[3]
    horas = total_duration // 60
    minutos = total_duration % 60

    return "Duração total da viagem: {}h{}min".format(horas, minutos)

# Função para identificar o segmento mais longo da viagem e formatar a saída
def longestSegment(trip):
    longest_segment = trip[0]
    for segm in trip:
        if segm[2] > longest_segment[2]:
            longest_segment = segm
    
    return "Segmento mais longo: {}-{} ({}km)".format(longest_segment[0], longest_segment[1], longest_segment[2])
        
# Função para calcular o custo total da viagem e formatar a saída
def calculateTotalCost(trip, consumo_por_km, preco_combustivel):
    total_cost = 0
    for segm in trip:
        total_cost += segm[2] * consumo_por_km * preco_combustivel
    
    return "Custo total da viagem: €{}".format(round(total_cost, 2))

# Função para carregar uma viagem a partir de um ficheiro e formatar a saída
def loadTripFromFile(filename):
    trip = []
    with open(filename, 'r', encoding='utf-8') as f:
        for line in f:
            parts = line.strip().split(",")
            origem = parts[0]
            destino = parts[1]
            distancia = int(parts[2])
            tempo = int(parts[3])
            trip.append((origem, destino, distancia, tempo))

    output = "\nNova viagem carregada do ficheiro:\n"
    for segm in trip:
        origemDestino = "{}-{}".format(segm[0], segm[1])
        distancia = segm[2]
        horas = segm[3] // 60
        minutos = segm[3] % 60
        output += "{:<20} {:>5}km {:02}h{:02}min\n".format(origemDestino, distancia, horas, minutos)

    return output
# Exemplo de teste

trip = [
    ("Aveiro", "Albergaria", 20, 20),
    ("Albergaria", "Esmoriz", 18, 9),
    ("Esmoriz", "Porto", 32, 16),
    ("Porto", "Coimbra", 143, 81),
    ("Coimbra", "Leiria", 73, 39),
    ("Leiria", "Lisboa", 108, 68)
]

# a) Calcular a duração total da viagem e imprimir
print(calculateTotalDuration(trip))

# b) Identificar o segmento mais longo e imprimir
print(longestSegment(trip))

# c) Calcular o custo total da viagem e imprimir
consumo_por_km = 0.06  # litros por km (exemplo: 6 litros/100km)
preco_combustivel = 1.80  # preço por litro em euros (exemplo)
print(calculateTotalCost(trip, consumo_por_km, preco_combustivel))

# d) Carregar uma nova viagem de um ficheiro e imprimir
filename = 'C:\\Users\\MARTIM\\Desktop\\Disciplinas\\FP_EE\\ExameChatGPT3\\nova_viagem.txt'
print(loadTripFromFile(filename))

# Output esperado para nova_viagem.txt:
# Faro-Beja             147km 01h36min
# Beja-Vidigueira        26km 00h20min

