"""
Write a Python program to convert a given string list to a tuple.

Original string: python 3.0
<class 'str'>
Convert the said string to a tuple:
('p', 'y', 't', 'h', 'o', 'n', '3', '.', '0')
<class 'tuple'>

"""
def string_list_to_tuple(str):
    lista = []
    for x in str:
        lista.append(x)
    y = tuple(lista)
    return y
        
        
def main():
    str = "python 3.0"
    print(string_list_to_tuple(str))
    print(type(string_list_to_tuple(str)))
    
main()