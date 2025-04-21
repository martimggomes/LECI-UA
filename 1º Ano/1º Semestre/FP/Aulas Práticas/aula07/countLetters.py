from unidecode import unidecode
dc = {}

c = 0
with open("C:\\Users\\MARTIM\\Desktop\\Disciplinas\\FP\\aula07\\examples\\pg3333.txt", encoding="utf-8") as f:
    for line in f:
        for l in line.split():
            l = unidecode(l.lower())
            for word in range(len(l)):
                if(l[word].isalpha()):
                    if(l[word] not in dc):
                        dc[l[word]] = 1
                    else:
                        dc[l[word]] += 1

for i in sorted(dc.keys()):
    
    print(i, dc[i])                      