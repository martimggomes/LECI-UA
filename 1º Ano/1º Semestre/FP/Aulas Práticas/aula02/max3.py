# coding: utf-8
# This program finds the maximum of two numbers.
# It uses the built-in max function.
# Can you do it with a conditional statement (if / if-else) instead?

x1 = float(input("number? "))
x2 = float(input("number? "))
x3 = float(input("number? "))
x4 = float(input("number? "))
mx = x4 

# Use a conditional statement instead of max function!
if mx < x1:
    mx = x1
elif mx < x2:
    mx = x2
elif mx < x3:
    mx = x3
    
print("O maior número é o número {}".format(mx))
    
