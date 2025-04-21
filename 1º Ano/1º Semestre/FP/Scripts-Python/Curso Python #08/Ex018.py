import math
ang = float(input("Ângulo: "))
sin = math.sin(math.radians(ang))
cos = math.cos(math.radians(ang))
tan = math.tan(math.radians(ang))
print("O valor do seno é de {} radianos, do cosseno é de {} radianos e o da tangente é de {} radianos.".format(sin, cos, tan))