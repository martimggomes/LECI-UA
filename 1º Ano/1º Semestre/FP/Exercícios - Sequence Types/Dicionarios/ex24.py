"""
Write a Python program to remove spaces from dictionary keys.

"""
student_list = {'S  001': ['Math', 'Science'], 'S    002': ['Math', 'English']}

new_student_list = {}

for key in student_list.keys():
    new_key = key.replace(" ", "")
    new_student_list[new_key] = student_list[key]

print(new_student_list)