""""
Em Python, um objeto pode ser composto por várias partes, 
como este: obj = ["one", 2, ("three", 4, {5, "six"})].

Complete a função abaixo para devolver uma lista com todas as strings 
contidas num dado objeto.Por exemplo, getAllStrings(obj) deve devolver 
['one', 'three', 'six'].

A função deve descobrir strings nos elementos de listas, tuplos, conjuntos e nas chaves 
e valores de dicionários.

"""

def getAllStrings(obj):
    """Get a list with all the strings contained in the given object."""

    lst = []
    if isinstance(obj, str):  # if obj is a string, just store it
        lst.append(obj)
    # If obj is a list, etc., we must call recursively for each of its elements
    elif type(obj) in (list, tuple, set):
        for elem in obj:
            lst.extend(getAllStrings(elem))
    elif type(obj) is dict:
        for key in obj:
            lst.extend(getAllStrings(key))
            lst.extend(getAllStrings(obj[key]))

    return lst


def main():
    obj1 = ["one", 2, ["three", 4, [5, "six"]]]
    obj2 = [1, "a", ("b", [{"c", "d", 2}, 3, (4, "e")], "f")]
    obj3 = {"a": 1, "b": ["c", "d"], (2, ("x", 3)): obj1}
    print(eval(input()))


if __name__ == "__main__":
    main()