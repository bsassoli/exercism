from random import seed, choices
from string import ascii_uppercase, digits
def _generate_name():
    return ''.join(choices(ascii_uppercase, k=2) + choices(digits, k=3))

class Robot:
    def __init__(self):
        self.name = _generate_name()
    
    def reset(self):
        seed(21)
        self.name = _generate_name()