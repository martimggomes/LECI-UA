"""
Write a Python program to filter the height and width of students, which are 
stored in a dictionary.

Original Dictionary:
{'Cierra Vega': (6.2, 70), 'Alden Cantrell': (5.9, 65), 'Kierra Gentry': (6.0, 68),
'Pierre Cox': (5.8, 66)}
Height > 6ft and Weight> 70kg:
{'Cierra Vega': (6.2, 70)}

"""

students = {
    'Cierra Vega': (6.2, 70),
    'Alden Cantrell': (5.9, 65),
    'Kierra Gentry': (6.0, 68),
    'Pierre Cox': (5.8, 66)
}

def filter_data(students):
    filtered_students = {}
    for n, (h, w) in students.items():
        if h > 6 and w >= 70:
            filtered_students[n] = (h, w)
    return filtered_students

def main():
    print(filter_data(students))

main()
        