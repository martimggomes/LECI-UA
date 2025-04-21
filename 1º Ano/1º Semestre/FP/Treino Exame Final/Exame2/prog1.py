# prog1.py

# Função para imprimir a viagem em formato de tabela
def printTrip(trip):
    for segm in trip:
        origemDestino = ("{}-{}".format(segm[0],segm[1]))
        distancia = segm[2]
        tempo = segm[3]
        horas = int(tempo // 60)
        minutos = int(tempo % 60)
        velocidade = float(distancia / (tempo / 60))
        print("{:^20}{:>6}km {:02}h{:02}min {:>8.1f}km/h".format(origemDestino, distancia, horas, minutos, velocidade))


# Função para calcular a distância total, tempo total e velocidade média
def statsTrip(trip):
    distancia_total = 0
    tempo_total = 0
    for segm in trip:
        distancia_total += segm[2]
        tempo_total += segm[3]
        velocidade_media = distancia_total / (tempo_total / 60)
    return distancia_total, tempo_total, velocidade_media
    
# Função para retornar os segmentos com maior velocidade
def topSpeed(trip, n):
    sorted_trip = sorted(trip, key=lambda segm: segm[2] / (segm[3] / 60), reverse=True)
    return sorted_trip[:n]

# Função para carregar uma viagem a partir de um ficheiro de texto
def loadTrip(filename):
    trip = []
    with open(filename, 'r', encoding='utf-8') as file:
        for line in file:
            origem, destino, distancia, tempo = line.strip().split(';')
            distancia = int(distancia)
            tempo = int(tempo)
            trip.append((origem, destino, distancia, tempo))
    return trip

# Ambiente de Teste
if __name__ == "__main__":
    # Exemplo de uma viagem com vários segmentos
    trip = [
        ("Aveiro", "Albergaria", 20, 20),
        ("Albergaria", "Espinho", 30, 15),
        ("Esmoriz", "Porto", 20, 12),
        ("Porto", "Coimbra", 143, 80),
        ("Coimbra", "Leiria", 73, 65),
        ("Leiria", "Lisboa", 160, 100)
    ]

    # Teste da função printTrip
    print("Tabela formatada com a informação dos segmentos:")
    print()
    printTrip(trip)

    # Teste da função statsTrip
    print("\nCálculo da distância total, tempo total e velocidade média:")
    distancia_total, tempo_total, velocidade_media = statsTrip(trip)
    print(f"Distância total: {distancia_total} km")
    print(f"Tempo total: {tempo_total//60}h{tempo_total%60}min")
    print(f"Velocidade média: {velocidade_media:.1f} km/h")

    # Teste da função topSpeed
    print("\nSegmentos com maior velocidade:")
    top_segments = topSpeed(trip, 3)
    printTrip(top_segments)

    # Teste da função loadTrip
    print("\nCarregamento de uma nova viagem a partir de ficheiro:")
    filename = 'viagem.txt'  # substitua pelo nome correto do ficheiro
    new_trip = loadTrip(filename)
    printTrip(new_trip)
