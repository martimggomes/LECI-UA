def evenTheOdd(string):
    even = ""
    odd = ""
    for index, char in enumerate(string):
        if index % 2 == 0:
            even += char
        else:
            odd += char
            
    return even + odd

def removeAdjacentDuplicates(s):
    new = ""
    for i in range(len(s)):
        if i == 0 or s[i] != s[i - 1]:
            new += s[i]
    return new

def repeatNumTimes(n):
    lista = []
    assert n >= 0
    for i in range(0, n):
        lista += [i] * i 
    return lista

def positionOfFirstLargest(arr):
    mx = arr[0]
    index = 0
    for i, a in enumerate(arr):
        if a > mx:
            mx = a
            index = i
    return index


def main():
    print(evenTheOdd("Martim"))
    print(removeAdjacentDuplicates("Mississippi"))
    print(repeatNumTimes(4))
    print(positionOfFirstLargest([1, 624, 123, 34, 12]))

main()
    