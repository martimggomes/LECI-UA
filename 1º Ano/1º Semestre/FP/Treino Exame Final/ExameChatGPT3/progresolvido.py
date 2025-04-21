# prog2.py

# Função para calcular a duração total da viagem e formatar a saída
def calculateTotalDuration(trip):
    total_tempo = sum(segment[3] for segment in trip)
    horas = total_tempo // 60
    minutos = total_tempo % 60
    return f"Duração total da viagem: {horas}h{minutos:02}min"

# Função para identificar o segmento mais longo da viagem e formatar a saída
def longestSegment(trip):
    longest = max(trip, key=lambda segment: segment[2])
    origemDestino = f"{longest[0]}-{longest[1]}"
    return f"Segmento mais longo: {origemDestino} ({longest[2]}km)"

# Função para calcular o custo total da viagem e formatar a saída
def calculateTotalCost(trip, consumo_por_km, preco_combustivel):
    total_distancia = sum(segment[2] for segment in trip)
    total_combustivel = total_distancia * consumo_por_km
    custo_total = total_combustivel * preco_combustivel
    return f"Custo total da viagem: €{custo_total:.2f}"

# Função para carregar uma viagem a partir de um ficheiro e formatar a saída
def loadTripFromFile(filename):
    trip = []
    with open(filename, 'r') as file:
        for line in file:
            origem, destino, distancia, tempo = line.strip().split(',')
            distancia = int(distancia)
            tempo = int(tempo)
            trip.append((origem, destino, distancia, tempo))

    output = "\nNova viagem carregada do ficheiro:\n"
    for segment in trip:
        origemDestino = f"{segment[0]}-{segment[1]}"
        distancia = segment[2]
        horas = segment[3] // 60
        minutos = segment[3] % 60
        output += f"{origemDestino:<20}{distancia:>6}km {horas:02}h{minutos:02}min\n"
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
filename = 'C:\\Users\\MARTIM\\Desktop\\Disciplinas\\FP_EE\\ExameChatGPT3\\nova_viagem.txt'  # substitua pelo nome correto do ficheiro
print(loadTripFromFile(filename))

# Output esperado para nova_viagem.txt:
# Faro-Beja             147km 01h36min
# Beja-Vidigueira        26km 00h20min
