# Constantes para indexar os tuplos:
NAME, DATE, OPEN, MAX, MIN, CLOSE, VOLUME = 0, 1, 2, 3, 4, 5, 6

def main():
    lst = loadStockFile("C:\\Users\\MARTIM\\Desktop\\Disciplinas\\FP_EE\\aula07\\nasdaq.csv")
    # Show just first and last tuples:
    print("first:", lst[1])
    print("last:", lst[-1])
    
    print("a) totVol=", totalVolume(lst))

    print("b) maxVal=", maxValorization(lst))
    
    stocksDic = stocksByDateByName(lst)
    print("c) CSCO@11:", stocksDic['2020-10-12']['CSCO'])
    print("c) AMZN@22:", stocksDic['2020-10-22']['AMZN'])

    port = {'NFLX': 100, 'CSCO': 80}
    print("d) portfolio@01:", portfolioValue(stocksDic, port, "2020-10-01"))
    print("d) portfolio@30:", portfolioValue(stocksDic, port, "2020-10-30"))

def loadStockFile(filename):
    lst = []
    with open(filename) as f:
        for line in f:
            parts = line.strip().split('\t')
            tup = (parts[NAME], parts[DATE], float(parts[OPEN]), float(parts[MAX]),
                   float(parts[MIN]), float(parts[CLOSE]), int(parts[VOLUME]))
            lst.append(tup)
    return lst

def totalVolume(lst):
    volume_dict = {}
    for entry in lst:
        empresa = entry[NAME]
        volume = entry[VOLUME]
        if empresa in volume_dict:
            volume_dict[empresa] += volume
        else:
            volume_dict[empresa] = volume
    return volume_dict

def maxValorization(lst):
    valorizacao_dict = {}
    
    for entry in lst:
        data = entry[DATE]
        empresa = entry[NAME]
        valor_abertura = entry[OPEN]
        valor_fecho = entry[CLOSE]
        
        # Calcular valorização relativa
        valorizacao = (valor_fecho / valor_abertura) - 1
        
        # Se a data ainda não está no dicionário, ou se a valorização atual for maior que a armazenada
        if data not in valorizacao_dict or valorizacao > valorizacao_dict[data][1]:
            valorizacao_dict[data] = (empresa, valorizacao)
    
    return valorizacao_dict

def stocksByDateByName(lst):
    stocks_dict = {}
    
    for entry in lst:
        data = entry[DATE]
        empresa = entry[NAME]
        
        if data not in stocks_dict:
            stocks_dict[data] = {}
        
        stocks_dict[data][empresa] = entry
    
    return stocks_dict

# Supondo que a função portfolioValue já esteja implementada
def portfolioValue(stocksDic, portfolio, date):
    total_value = 0
    if date in stocksDic:
        for empresa, quantidade in portfolio.items():
            if empresa in stocksDic[date]:
                valor_fecho = stocksDic[date][empresa][CLOSE]
                total_value += valor_fecho * quantidade
    return total_value

if __name__ == "__main__":
    main()
