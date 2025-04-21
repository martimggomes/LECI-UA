import math

catA = float(input("Cateto A: "))
catB = float(input("Cateto B: "))

hipC = math.sqrt(catA * catA + catB * catB)

# Calculate the cosine of the angle
cos_angle = catA / hipC

# Calculate the angle in radians
angle_radians = math.acos(cos_angle)

# Convert the angle to degrees
angle_degrees = math.degrees(angle_radians)

print("Hipotenusa: {}\nÂngulo entre o cateto A e a hipotenusa: {}".format(hipC, angle_degrees))