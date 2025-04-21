# Constantes para indexar os tuplos:
EMPRESA, DATA, ABERTURA, MAXIMO, MINIMO, FECHAMENTO, VOLUME = 0, 1, 2, 3, 4, 5, 6

def main():
    lst = loadStockFile("C:\\Users\\MARTIM\\Desktop\\Disciplinas\\FP_EE\\ExameChatGPT\\stock_prices.csv")
    print("Primeiro registro:", lst[1])
    print("Último registro:", lst[-1])

    print("a) Preço médio de fechamento:", averageClosingPrice(lst))

    print("b) Maior variação diária:", dailyPriceChange(lst))

    stocksDic = stocksByDate(lst)
    print("c) AAPL em 2024-09-15:", stocksDic['2024-09-15']['AAPL'])

    portfolio = {'AAPL': 50, 'TSLA': 30}
    print("d) Variação da carteira em 2024-09-15:", portfolioDailyChange(stocksDic, portfolio, "2024-09-15"))

def loadStockFile(filename):
    lst = []
    with open(filename) as f:
        next(f)  # Skip header row
        for line in f:
            parts = line.strip().split(',')
            empresa = parts[EMPRESA]
            data = parts[DATA]
            tup = (empresa, data, float(parts[ABERTURA]), float(parts[MAXIMO]),
                   float(parts[MINIMO]), float(parts[FECHAMENTO]), int(parts[VOLUME]))
            lst.append(tup)
    return lst

def averageClosingPrice(lst):
    avgClose = {}
    count = {}

    for tup in lst:
        empresa = tup[EMPRESA]
        if empresa not in avgClose:
            avgClose[empresa] = 0
            count[empresa] = 0
        
        avgClose[empresa] += tup[FECHAMENTO]
        count[empresa] += 1

    for empresa in avgClose:
        avgClose[empresa] /= count[empresa]

    return avgClose

def dailyPriceChange(lst):
    change = {}

    for tup in lst:
        data = tup[DATA]
        empresa = tup[EMPRESA]
        abertura = tup[ABERTURA]
        fechamento = tup[FECHAMENTO]

        variacao = (fechamento - abertura) / abertura * 100

        if data not in change or variacao > change[data][1]:
            change[data] = (empresa, variacao)

    return change

def stocksByDate(lst):
    dic = {}

    for tup in lst:
        data = tup[DATA]
        empresa = tup[EMPRESA]
        if data not in dic:
            dic[data] = {}
        dic[data][empresa] = (tup[ABERTURA], tup[FECHAMENTO])

    return dic

def portfolioDailyChange(stocks, portfolio, date):
    assert date in stocks
    val_open = 0.0
    val_close = 0.0

    for empresa in portfolio:
        quantidade = portfolio[empresa]
        abertura = stocks[date][empresa][0]
        fechamento = stocks[date][empresa][1]

        val_open += quantidade * abertura
        val_close += quantidade * fechamento

    change = ((val_close - val_open) / val_open) * 100
    return change

if __name__ == "__main__":
    main()
