"""
No jogo Bulls-and-Cows, o jogador tenta descobir um código secreto composto por N 
símbolos de um alfabeto pequeno, por exemplo algarismos ou letras.
Em cada tentativa, o jogador introduz N símbolos e o computador dá uma pontuação que 
indica quantos símbolos estão certos na posição certa (os Bulls) e quantos estão certos,
mas na posição errada (as Cows). Por exemplo, se o segredo for '4271', a tentativa '1234'
tem uma pontuação de 1 Bull (o '2') e 2 Cows ('1' e '4').

Complete a função score(guess, secret) para devolver a pontuação de uma tentativa.
Por exemplo, score('1234', '4271') deve devolver (1, 2).

"""

def score(guess, secret):
    assert len(guess) == len(secret)
    pontuation: tuple = (0, 0)
    for i in range(len(guess)):
        letter = guess[i]
        if letter == secret[i]:
            pontuation = (pontuation[0] + 1, pontuation[1])
        elif letter in secret:
            pontuation = (pontuation[0], pontuation[1] + 1)
    return pontuation

print(score('1234', '4271'))