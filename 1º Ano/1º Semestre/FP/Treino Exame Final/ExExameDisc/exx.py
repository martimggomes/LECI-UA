import re

# Constantes para indexar os tuplos:
NAME, DATE, OPEN, MAX, MIN, CLOSE, VOLUME = 0, 1, 2, 3, 4, 5, 6

def loadStockFile(filename):
    #Completar...
    lst = []
    with open(filename) as file:
        for line in file:
            parts = line.strip().split("\t")
            name = parts[NAME]
            date = parts[DATE]
            open_price = float(parts[OPEN])
            max_price = float(parts[MAX])
            min_price = float(parts[MIN])
            close = float(parts[CLOSE])
            volume = int(parts[VOLUME])
            tup = [name, date, open_price, max_price, min_price, close, volume]
            lst.append(tup)
    return lst

def totalVolume(lst):
    totVol = {}
    for tup in lst:
        if tup[NAME] not in totVol:
            totVol[tup[NAME]] = [tup[VOLUME]]
        else:
            totVol[tup[NAME]] += [tup[VOLUME]]
    return totVol

def maxValorization(lst):
    vMax = {}
    for data in range(1, 31):
        maxDiario = 0
        maxDiarioComp = "No data"
        for tup in lst:
            dia = int(tup[DATE].split("-")[2]) #tira os traços e acede ao 3º elemento
            if dia == data:
                maxComp = (tup[CLOSE] / tup[OPEN] - 1)
                if maxComp > maxDiario:
                    maxDiario = maxComp
                    maxDiarioComp = tup[NAME]
        
        if maxDiarioComp != "No data":
            vMax[DATE] = (maxDiarioComp, maxDiario)
    return vMax

def stocksByDateByName(lst):
    dic = {}
    for tup in lst:
        if tup[DATE] not in dic:
            dic[tup[DATE]] = {}
        dic[tup[DATE]][tup[NAME]] = tup
        
    return dic

# Função incompleta
def portfolioValue(stocks, portfolio, date):
    assert date in stocks
    val = 0.0
    for element in portfolio:
        val += portfolio[element] * stocks[date][element][CLOSE]
    return val

def main():
    lst = loadStockFile("C:\\Users\\MARTIM\\Desktop\\Disciplinas\\FP_EE\\ExExameDisc\\nasdaq.csv")
    # Mostrar apenas o primeiro e o último tuplo:
    print("first:", lst[1])
    print("last:", lst[-1])
    
    print("a) totVol=", totalVolume(lst))

    print("b) maxVal=", maxValorization(lst))
    
    stocksDic = stocksByDateByName(lst)
    print("c) CSCO@11:", stocksDic['2020-10-12']['CSCO'])
    print("c) AMZN@22:", stocksDic['2020-10-22']['AMZN'])

    # Parte incompleta
    port = {'NFLX': 100, 'CSCO': 80}
    print("d) portfolio@01:", portfolioValue(stocksDic, port, "2020-10-01"))
    print("d) portfolio@30:", portfolioValue(stocksDic, port, "2020-10-30"))


if __name__ == "__main__":
    main()
