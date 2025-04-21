import sys

RANK, CLUB, COUNTRY, SCORE, VAR, PSCORE, UP = 0, 1, 2, 3, 4, 5, 6

# 1
def loadFile(fname):
    lst = []
    with open(fname, encoding="utf8") as f:
        head = f.readline()
        if not head.startswith("ranking,"):
            raise Exception("Wrong file format")
        for line in f:
            line = line.strip()
            parts = line.split(",")
            # Codificar a variação como inteiro com sinal
            #var = int(parts[UP] + parts[VAR])  # Funciona se o sinal for + ou - apenas
            var = int(parts[VAR])
            if parts[UP] == '-':
                var = -var
            tup = (int(parts[0]), parts[1], parts[2],
                   int(parts[3]), var, int(parts[5]))
            lst.append(tup)

    return lst

# 2
def listCountry(lst, country, file=sys.stdout):
    print("{:40s} {:30s} {:>8s} {:>8s}".format("Club", "Pais", "Rank", "Score"), file=file)
    for eq in lst:
        #rank, club, pais, .... = eq
        if eq[COUNTRY] == country:
            print("{:40s} {:30s} {:8d} {:8d}".format(eq[CLUB], eq[COUNTRY], eq[RANK], eq[SCORE]),
                 file=file)
    return

# 3
def saveCountry(lst, country, fname):
    with open(fname, "w", encoding="utf8") as f:
        listCountry(lst, country, f)


# 4
# {"Angola": ["Luanda FC", "..."], "Andorra": []}
def clubsByCountry(lst):
    dic = {}
    for eq in lst:
        club = eq[CLUB]
        pais = eq[COUNTRY]
        if pais in dic:
            dic[pais].append(club)
        else:
            dic[pais] = [club]
    return dic


# 5a
def bestRiseA(lst):
    best = lst[0]
    for tup in lst:
        if tup[VAR] > best[VAR]:
            best = tup
    return best

# 5b
def bestRiseB(lst):
    ibest = 0
    for i in range(1, len(lst)):
        if lst[i][VAR] > lst[ibest][VAR]:
            ibest = i
    return lst[ibest]

#5c
def bestRiseC(lst):
    eq = max(lst, key=lambda tup: tup[VAR])
    return eq


# 6
# HOMEWORK!

# 7a 
def countryRankA(lst):
    # criar dicionário de país -> [lista de ranks das equipas desse país]
    dic = {}
    for eq in lst:
        rank = eq[RANK]
        pais = eq[COUNTRY]
        if pais in dic:
            dic[pais].append(rank)
        else:
            dic[pais] = [rank]
    # Criar dicionario de país -> rank médio
    dic2 = {country: sum(ranks)/len(ranks) for country, ranks in dic.items()}
    return dic2

# 7b alternativa
def countryRankB(lst):
    # Criar dicionário país -> [soma, contagem]
    # com a soma dos ranks e contagem das equipas desse país
    dic = {}
    for tup in lst:
        country = tup[COUNTRY]
        rank = tup[RANK]
        if country not in dic:
            dic[country] = [rank, 1]
        else:
            sumcount = dic[country]
            sumcount[0] += rank
            sumcount[1] += 1
    # Criar dicionario de país -> rank médio
    avDic = {country: sumrank/count  for country, (sumrank, count) in dic.items() }
    return avDic


# 7 e 8
def printAverageRankByCountry(lst):
    dic = countryRankA(lst)
    assert dic == countryRankB(lst)     # para confirmar que as duas alternativas dão o mesmo!
    countriesRank = sorted( dic.items(), key=lambda pair: pair[1] )
    for country, av in countriesRank:
        print("{:30s}\t{:10.2f}".format(country, av))
    return


def main():
    #fname = input("File? ")
    fname = "Soccer_Football Clubs Ranking.csv"
    lst = loadFile(fname)
    listCountry(lst, "Mozambique")
    saveCountry(lst, "Angola", "Angola.txt")

    dic = clubsByCountry(lst)
    #print(dic)    

    a = bestRiseA(lst)
    b = bestRiseB(lst)
    c = bestRiseC(lst)
    print(a, b, c, sep="\n")

    printAverageRankByCountry(lst)


if __name__ == "__main__":
    main()