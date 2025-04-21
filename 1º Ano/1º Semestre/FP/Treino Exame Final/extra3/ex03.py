# Given a string s and a string t, return a string in which all the characters
# of s that occur in t have been replaced by a _ sign. The comparisons are
# case sensitive.

def replaceCharactersWithUnderscores(s, t):
    # Your code here...
    new_str = ""
    
    for i in s:
        if i in t:
            new_str += "_"
        else:
            new_str += i
            
    return new_str

def main():
    
    print(replaceCharactersWithUnderscores("Rita", "Maria"))
    
main()
            