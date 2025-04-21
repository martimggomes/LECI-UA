from random import randint

def generateRandom(min, max):
    return randint(min, max)
    
    
start_range = 1
end_range = 100

def playGame():
    target_number = generateRandom(start_range, end_range)
    
    print("Guess a number between 1-100\n")

    numberofguesses = 0

    while True:
        numberofguesses += 1
        print(f"Guess #{numberofguesses}: ", end='')
        guess = int(input(""))
        
        if guess > target_number:
            print("Too High!")
        elif guess < target_number:
            print("Too low!")
        else:
            print("Congratulations! You guessed the number!")
            print(f"You guessed the number in {numberofguesses} chances")
            numberofguesses = 0
            playAgain = str(input("Would you want to continue playing? [S/N] ")).upper()
            while playAgain not in ["S", "N"]:
                print("Digite ou S ou N!")
                playAgain = str(input("Would you want to continue playing? [S/N] ")).upper()
            if playAgain == "S":
                target_number = generateRandom(start_range, end_range)
                print("Guess a number between 1-100\n")
                continue
            elif playAgain == "N":
                break
    print("Thanks for playing!")
        
def main():
    playGame()
        
    
main()