def max2(x, y):
    if x < y:
        return y
    else:
        return x
    
def max3(x, y, z):
    if x > y and x > z:
        return x
    elif y > x and y > z:
        return y
    elif z > x and z > y:
        return z
    
def main():
    
    print(max2(4, 3))
    print(max2(-3,-2))
    print(max2(-7384847,-324242))
    print(max2(1872363,0))
    print(max2(643,-123))
    print(max2(-3,-21))
    
    print(max3(1872363,0,5))
    print(max3(643,-123,0))
    print(max3(-3,-21,234))
    
main()