# alunos_notas.py

# Função para adicionar um aluno ao dicionário
def adicionarAluno(alunos, nome):
    alunos = {}
    if nome not in alunos:
        alunos[nome] = {}
    else:
        print("Esse nome já está cadastrado")

# Função para adicionar uma nota a um aluno
def adicionarNota(alunos, nome, disciplina, nota):
    if nome in alunos:
        alunos[nome][disciplina] = nota
    else:
        print("O aluno {} não está cadastrado. Adicione o aluno primeiro".format(nome))

# Função para calcular a média das notas de um aluno
def calcularMedia(alunos, nome):
    if nome in alunos and alunos[nome]:
        notas = alunos[nome].values()
        media = sum(notas) / len(notas)
        return media
    else:
        print("Aluno não cadastrado")
        return 0

# Função para encontrar o aluno com a melhor média
def encontrarMelhorAluno(alunos):
    melhor_aluno = None
    melhor_media = 0
    for aluno, notas in alunos.items():
        if notas:
            media = calcularMedia(alunos, aluno)
            if media > melhor_media:
                melhor_media = media
                melhor_aluno = aluno
            
    return melhor_aluno, melhor_media

# Função para exibir o relatório de um aluno com formatação interna
def exibirRelatorio(alunos, nome):
    if nome in alunos:
        print("Relatório de {}:".format(nome))
        print("Disciplina    Nota")
        print("-"*18)
        for disciplina, nota in alunos[nome].items():
            print("{:<10} {:>6}\n".format(disciplina, nota))
    else:
        print("Aluno não cadastrado")

# Exemplo de teste

# Inicializando o dicionário de alunos
alunos = {"João": {"Matemática": 16, "Física": 14},
    "Maria": {"Matemática": 18, "Física": 17},
    "Ana": {"Matemática": 14, "Física": 15}
}

# a) Adicionar alunos ao dicionário
adicionarAluno(alunos, "João")
adicionarAluno(alunos, "Maria")
adicionarAluno(alunos, "Ana")

# b) Adicionar notas aos alunos
adicionarNota(alunos, "João", "Matemática", 16)
adicionarNota(alunos, "João", "Física", 14)
adicionarNota(alunos, "Maria", "Matemática", 18)
adicionarNota(alunos, "Maria", "Física", 17)
adicionarNota(alunos, "Ana", "Matemática", 14)
adicionarNota(alunos, "Ana", "Física", 15)

# c) Calcular e exibir a média das notas de um aluno
media_joao = calcularMedia(alunos, "João")
print(f"Média de João: {media_joao:.2f}")

# d) Encontrar e exibir o aluno com a melhor média
melhor_aluno, melhor_media = encontrarMelhorAluno(alunos)
print(f"Melhor aluno: {melhor_aluno} com média {melhor_media:.2f}")

# e) Exibir o relatório completo de um aluno
exibirRelatorio(alunos, "Maria")
