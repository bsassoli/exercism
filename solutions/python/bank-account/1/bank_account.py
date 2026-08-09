class BankAccount:
    def __init__(self, balance=0):
        self.is_open = False
        self.balance = balance

    def get_balance(self):
        if not self.is_open:
            raise ValueError('account not open')
        else:
            return self.balance

    def open(self):
        if self.is_open:
            raise ValueError('account already open')
        else:
            self.is_open = True

    def deposit(self, amount):
        if amount < 0:
            raise ValueError('amount must be greater than 0')
        if not self.is_open:
            raise ValueError('account not open')
        else:
            self.balance += amount

    def withdraw(self, amount):
        if amount < 0:
            raise ValueError('amount must be greater than 0')
        if not self.is_open:
            raise ValueError('account not open')
        if self.balance - amount < 0:
            raise ValueError('amount must be less than balance')
        else:
            self.balance -= amount

    def close(self):
        if not self.is_open:
            raise ValueError('account not open')
        self.balance = 0
        self.is_open = False
