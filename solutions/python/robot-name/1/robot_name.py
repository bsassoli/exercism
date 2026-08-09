import random
import string
def _generate_name():
    return random.choice(string.ascii_uppercase)+random.choice(string.ascii_uppercase)+random.choice(string.digits) +random.choice(string.digits)+random.choice(string.digits)
class Robot:
    def __init__(self):
        self.name = _generate_name()
    
    def reset(self):
        random.seed(21)
        self.name = _generate_name()