import math
catop = float(input("Cateto oposto: "))
catadj = float(input("Cateto adjacente: "))
#hipot = math.sqrt((catop)**2 + (catadj)**2)
hipot = math.hypot(catop,catadj)
print("O comprimento da hipotenusa é de {}".format(hipot))