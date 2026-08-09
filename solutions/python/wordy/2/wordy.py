VALID_OPS = ["plus", "minus", "multiplied", "divided"]

LAMBDAS = [
       lambda x, y: x + y,
       lambda x, y: x - y,
       lambda x, y: x * y,
       lambda x, y: x / y,
       ]

OPS = {identifier: op for identifier, op in zip(VALID_OPS, LAMBDAS)}

def clean(question):
    if not question.startswith("What is"):        
        raise ValueError("unknown operation")
    return question.removeprefix("What is").removesuffix("?").replace("by", "").split()


class OperationException(Exception):
    def __init__(self):
        self.message = "unknown operation"

class SyntaxException(Exception):
    def __init__(self):
        self.message = "syntax error"

def op(operand1, operator, operand2, mapping=OPS):
    return(mapping[operator](operand1, operand2))


# case 1: int
# case 2: "3 plus 2" int op int
# case 3: "3 plus 1 minus 2" int op exp
# <EXP> ::=  <INT>
#            | <INT> <OP> <INT>
#            | <INT> <OP> <EXP>

    
def evaluate(exp):
    try:
        if len(exp) == 0:
            raise SyntaxException
        if not isinstance(exp, list):  
            return int(exp) # base case 1: atomic expression is just int
        if len(exp) == 1 and exp[0].isdigit():
            return int(exp[0]) # base case 2: atomic expression is positive int
        if len(exp) == 1 and exp[0][0]=='-':
            return int(exp[0]) # base case 3: atomic expression is negative int
        if len(exp) == 3:
            return op(evaluate(exp[0]), exp[1], evaluate(exp[2])) # recursive case 1
        if len(exp) > 3:
            return op(evaluate(exp[0:3]), exp[3], evaluate(exp[4:])) # recursive case 2
        if exp[1] not in OPS:
            raise OperationException
        raise SyntaxException 
    except OperationException as e:
        raise ValueError(e.message)
    except SyntaxException as e:
        raise ValueError(e.message)
    except Exception as e:
        raise ValueError("syntax error")


def answer(question):
    return evaluate(clean(question))
