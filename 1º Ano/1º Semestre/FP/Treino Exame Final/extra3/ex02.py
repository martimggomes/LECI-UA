# Dada uma sequência lst, devolva o maior n tal que
# os primeiros n elementos igualam os últimos n elementos (sem sobreposição).

def firstEqualLast(lst):
    n = 0
    for i in range(1, len(lst) // 2 + 1):
        if lst[:i] == lst[-i:]:
            n = i
    return n

def main():
    print(firstEqualLast([2, 4, 5, 8]))
    
if __name__ == "__main__":
    main()