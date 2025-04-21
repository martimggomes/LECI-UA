def intersection(a, b, c, d):
    """Return the intersection of intervals [a, b[ and [c, d[."""
    assert a <= b, "Intervalo [a, b[ inválido"
    assert c <= d, "Intervalo [c, d[ inválido"
    
    e = max(a, c)
    f = min(b, d)
    
    if e >= f:
        return (0, 0)
    
    return (e, f)


def testIntersection(a, b, c, d, x, y):
    """Call intersection, print result and check against expected result."""
    print(f"intersection({a}, {b}, {c}, {d})", end=" ")
    (e, f) = intersection(a, b, c, d)
    check = "OK" if (e, f) == (x, y) else "FAIL"
    print(f"--> ({e}, {f}) {check}")


def main():
    testIntersection(1, 6, 4, 8,  4, 6)
    testIntersection(1, 6, 3, 5,  3, 5)
    testIntersection(1, 3, 4, 6,  0, 0)
    testIntersection(2, 5, 5, 9,  0, 0)
    testIntersection(0, 2, 1, 3,  1, 2)
    testIntersection(3, 7, 0, 3,  3, 3)
    testIntersection(-1, 2, 0, 1,  0, 1)
    testIntersection(4, 4, 2, 6,  0, 0)  # Caso limite onde o intervalo [a, b[ é vazio
    # Acrescente mais casos de teste se desejar...
    
main()


