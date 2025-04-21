"""
 Write a Python program to convert more than one list to a nested dictionary.
Original strings:

['S001', 'S002', 'S003', 'S004']
['Adina Park', 'Leyton Marsh', 'Duncan Boyle', 'Saim Richards']
[85, 98, 89, 92]

Nested dictionary:
[{'S001': {'Adina Park': 85}}, {'S002': {'Leyton Marsh': 98}}, 
{'S003': {'Duncan Boyle': 89}}, {'S004': {'Saim Richards': 92}}]

"""

student_id = ["S001", "S002", "S003", "S004"] 
student_name = ["Adina Park", "Leyton Marsh", "Duncan Boyle", "Saim Richards"] 
student_grade = [85, 98, 89, 92]

def nested_dictionary(student_id, student_name, student_grade):
    nested_dict = {}
    for id, name, grade in zip(student_id, student_name, student_grade):
        nested_dict[id] = {name: grade} 
    return nested_dict

def main():
    nested_dict = nested_dictionary(student_id, student_name, student_grade)
    print(nested_dict)

main()