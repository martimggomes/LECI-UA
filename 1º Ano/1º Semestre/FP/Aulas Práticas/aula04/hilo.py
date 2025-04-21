# Complete the code to make the HiLo game.

import random

def playHiLo():
    # Pick a random number between 1 and 100, inclusive
    secret = random.randrange(1, 101)

    print("I picked a number between 1 and 100. Can you guess it?")
    # put your code here
    count = 1
    tentativa = -1
    while tentativa != secret:
        tentativa = int(input("Tentativa: "))
        if tentativa < secret:
            print("High")
            count += 1
        elif tentativa > secret:
            print("Low")
            count += 1
        elif tentativa == secret:
            print("Acertou no número {} em {} tentativas!".format(secret, count))


playHiLo()

