def get_user_input(journeys, budget):
    
    while True:
        journey_input = input("Jornada? ")
        if journey_input in journeys:
            break
        elif journey_input == 0:
            print("Saldo: {} €".format(round(budget, 2)))
            exit(0)
        else:
            print("Jornada Inválida")
            
    
    match_id = 1
    with open("C:\\Users\\MARTIM\\Desktop\\Disciplinas\\FP_EE\\extra2\\Jornadas.csv","w") as f:
        for match in journeys[journey_input]:
            while True:
                bet = input("{} {} vs {}: ".format(match_id, match[0], match[1]))
                if bet in ['1', 'X', '2'].upper():
                    f.write("{}: {}".format(match_id, bet))
                    match_id += 1
                    break
                else: 
                    print("Aposta Inváalida")
        
    budget = 
    
def print_results(journeys, journey, budget):
    with open("C:\\Users\\MARTIM\\Desktop\\Disciplinas\\FP_EE\\extra2\\Jogos.csv", 'r') as f:
        bets = f.readlines()
        bets = [bet.strip().split(',') for bet in bets]
        bets = {bet[0]: bet[1] for bet in bets} 
        
    

            
def main():
    
    budget = 0
    journeys = {}
    print("Interface")
    get_user_input(budget, journeys)

if __name__ == "__main__":
    main()
    