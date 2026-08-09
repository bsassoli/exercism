import re

def is_paired(input_string):
    # optionally, remove all non parens
    input_string = re.sub(r"[^\[{}()\]]", "", input_string)
    PARENS = {'[': ']', '(': ')', '{': '}'}
    stack = []
    for char in input_string:
        if char in PARENS: # if it is an opening paren, put on stack
            stack.append(char)
        if char in PARENS.values(): # if it's a closing paren:
            # if they don't match or there's no opening paren return false
            if not stack or char != PARENS[stack.pop()]: 
                return False
    if stack: # stack not empty so no balancing, return false
        return False
    return True
