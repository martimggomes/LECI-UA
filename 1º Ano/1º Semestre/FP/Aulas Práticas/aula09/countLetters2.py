from unidecode import unidecode

def countLetters(filename):
    dc = {}
    try:
        with open(filename, "r", encoding="utf-8") as f:
            text = f.read()
            text = unidecode(text.lower())  # Remove acentos e converte para minúsculas
            for char in text:
                if char.isalpha():  # Verifica se o caractere é uma letra
                    if char not in dc:
                        dc[char] = 1
                    else:
                        dc[char] += 1
    except FileNotFoundError:
        print(f"File {filename} not found.")
        return {}

    return dc                   

def main():
    filename = "C:\\Users\\MARTIM\\Desktop\\Disciplinas\\FP\\aula07\\examples\\pg3333.txt"
    letters = countLetters(filename)
    
    if letters:  # Verifica se o dicionário não está vazio
        for l in sorted(letters, key=letters.get, reverse=True):
            print(l, letters[l])
            
    usedTheMostCount = max(letters.values())
    usedTheMost = [letter for letter in letters.keys() if letters[letter] == usedTheMostCount][0]
    print("A letra mais usada foi a letra '{}', tendo sido usada {} vezes!".format(usedTheMost.upper(), usedTheMostCount))
    
        
if __name__ == "__main__":
    main()
