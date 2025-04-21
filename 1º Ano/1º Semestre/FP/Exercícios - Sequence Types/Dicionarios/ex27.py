"""
Write a Python program to print a dictionary line by line.

"""

students = {'Aex': {'class': 'V', 'roll_id': 2}, 'Puja': {'class': 'V', 'roll_id': 3}}

for student, details in students.items():
    print(student)
    
    for key, value in details.items():
        print(key, ':', value)