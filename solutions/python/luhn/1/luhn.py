class Luhn:
    def __init__(self, card_num):
        self.num = card_num

    def _strip(self):
        return ('').join(digit for digit in self.num if digit.isnumeric())
    
    def valid(self):
        if not all(dig.isnumeric() for dig in self.num if dig != ' '):
            return False
        stripped = self._strip()
        length = len(stripped)
        if length <= 1:
            return False
        doubles = 0
        ix = length - 1
        while ix >= 0:
            doubles += int(stripped[ix])
            ix -= 1
            if ix < 0:
                break
            res = int(stripped[ix]) * 2
            if res > 9:
                res -= 9
            doubles += res
            ix -= 1
            if ix < 0:
                break
        print(doubles)
        return doubles % 10 == 0
        
