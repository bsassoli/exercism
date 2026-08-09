import re

def is_paired(input_string):
    str = re.sub(r"[^\[{}()\]]", "", input_string)
    PARENS = {'[': ']', '(': ')', '{': '}'}
    stack = []
    for ix, char in enumerate(str):
        if char in PARENS:
            stack.append(char)
        elif char in PARENS.values():
            if not stack:
                return False
            if char != PARENS[stack.pop()]:
                return False
    if stack:
        return False
    return True
    
            
    

            
        # the first must be an opening bracket of type T
    # then next must be an opening bracket of any type T'
    # or a closing bracket of the same type T

                                   
