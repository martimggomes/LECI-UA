# Função para calcular a velocidade média em cada segmento
def calcular_velocidade_media(tempos, distancias):
    velocidades_medias = []
    
    for i in range(len(tempos)):
        velocidade = (distancias[i] / tempos[i]) * 60
        velocidades_medias.append(round(velocidade, 2))
        
    return velocidades_medias
        
# Função para calcular o tempo total (em horas) e a distância total (em km)
def calcular_totais(tempos, distancias):
    tempo_total = 0
    distancia_total = 0
    tempo_minutos = 0
    
    for tempo in tempos:
        tempo_minutos += tempo
        tempo_total = tempo_minutos / 60
                 
    for distancia in distancias:
        distancia_total += distancia
        
    return tempo_total, distancia_total


# Função para verificar se algum segmento ultrapassou o limite de velocidade
def verificar_limite_velocidade(velocidades_medias, limite):
    for velocidade in velocidades_medias:
        if velocidade < limite:
            return False
        else:
            return True

# Programa principal para testar as funções
def main():
    # Listas de exemplo
    tempos_viagem = [30, 45, 60, 20]  # tempos em minutos
    distancias = [30, 50, 70, 20]     # distâncias em km
    limite_velocidade = 100           # limite de velocidade em km/h
    
    # TODO: Chamar a função calcular_velocidade_media e exibir o resultado
    velocidades_medias = calcular_velocidade_media(tempos_viagem, distancias)
    print(f"Velocidades médias: {velocidades_medias}")
    
    # TODO: Chamar a função calcular_totais e exibir o resultado
    tempo_total, distancia_total = calcular_totais(tempos_viagem, distancias)
    print(f"Tempo total: {tempo_total:.3f} horas")
    print(f"Distância total: {distancia_total} km")
    
    # TODO: Chamar a função verificar_limite_velocidade e exibir o resultado
    excesso = verificar_limite_velocidade(velocidades_medias, limite_velocidade)
    print(f"Excesso de velocidade: {'Sim' if excesso else 'Não'}")


# Chamar o programa principal
if __name__ == "__main__":
    main()
