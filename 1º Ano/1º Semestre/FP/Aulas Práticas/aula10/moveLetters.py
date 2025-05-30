"""
Dada uma string, construa e devolva uma nova string onde
todas as letras 'x' apareçam movidas para o fim da string.
A função tem de ser recursiva. Não pode usar ciclos.

endX("xxre") → "rexx"
endX("xxhixx") → "hixxxx"
endX("hixhix") → "hihixx"
"""

def endX(s):
   if s == '':
       return ''
   elif s[0] == 'x':
       return endX(s[1:]) + 'x'
   else:
       return s[0] + endX(s[1:])
   
   
def main():
    print(endX("xxre"))
    print(endX("xxhixx"))
    print(endX("hixhix"))
    
main()
    