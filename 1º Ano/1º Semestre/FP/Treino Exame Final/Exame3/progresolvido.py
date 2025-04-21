# Função para calcular a velocidade média em cada segmento
def calcular_velocidade_media(tempos, distancias):
    # Crie uma lista vazia para armazenar as velocidades médias
    velocidades_medias = []
    
    # Itere sobre os tempos e distâncias para calcular a velocidade média
    for i in range(len(tempos)):
        # Calcule a velocidade média em km/h e adicione à lista
        velocidade = (distancias[i] / tempos[i]) * 60  # Convertendo minutos para horas
        velocidades_medias.append(velocidade)
    
    # Retorne a lista de velocidades médias
    return velocidades_medias


# Função para calcular o tempo total (em horas) e a distância total (em km)
def calcular_totais(tempos, distancias):
    # Calcule o tempo total em horas
    tempo_total = sum(tempos) / 60  # Convertendo minutos para horas
    
    # Calcule a distância total em km
    distancia_total = sum(distancias)
    
    # Retorne os totais como uma tupla (tempo_total, distancia_total)
    return (tempo_total, distancia_total)


# Função para verificar se algum segmento ultrapassou o limite de velocidade
def verificar_limite_velocidade(velocidades_medias, limite):
    # Itere sobre as velocidades médias para verificar se alguma ultrapassa o limite
    for velocidade in velocidades_medias:
        if velocidade > limite:
            return True  # Retorne True se o limite for ultrapassado
    
    return False  # Retorne False se nenhuma velocidade ultrapassar o limite


# Programa principal para testar as funções
def main():
    # Listas de exemplo
    tempos_viagem = [30, 45, 60, 20]  # tempos em minutos
    distancias = [30, 50, 70, 20]     # distâncias em km
    limite_velocidade = 100           # limite de velocidade em km/h
    
    # Calcular velocidades médias
    velocidades_medias = calcular_velocidade_media(tempos_viagem, distancias)
    print(f"Velocidades médias: {velocidades_medias}")
    
    # Calcular tempo total e distância total
    tempo_total, distancia_total = calcular_totais(tempos_viagem, distancias)
    print(f"Tempo total: {tempo_total:.3f} horas")
    print(f"Distância total: {distancia_total} km")
    
    # Verificar se houve excesso de velocidade
    excesso = verificar_limite_velocidade(velocidades_medias, limite_velocidade)
    print(f"Excesso de velocidade: {'Sim' if excesso else 'Não'}")


# Chamar o programa principal
if __name__ == "__main__":
    main()
