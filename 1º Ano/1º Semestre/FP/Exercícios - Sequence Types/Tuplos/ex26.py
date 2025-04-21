"""
Write a Python program to check if a specified element appears in a tuple of tuples.

Original list:
(('Red', 'White', 'Blue'), ('Green', 'Pink', 'Purple'), ('Orange', 'Yellow', 'Lime'))
Check if White presenet in said tuple of tuples!
True
Check if White presenet in said tuple of tuples!
True
Check if Olive presenet in said tuple of tuples!
False

"""

def check_in_tuples(colors, c):
    
    for t in colors:
        if c in t:
            return True
        else:
            return False    
    
    
def main():
    
    colors = (('Red', 'White', 'Blue'), ('Green', 'Pink', 'Purple'), ('Orange', 'Yellow', 'Lime'))
    while True:
        color = input("Color? ")
        print("Check if {} present in said tuple of tuples!".format(color))
        print(check_in_tuples(colors, color.capitalize()))
    
main()