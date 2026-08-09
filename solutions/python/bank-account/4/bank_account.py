from threading import Lock

def apply_lock(func):
        def wrapper(self, *args, **kwargs):
            with self.lock:
                return func(self, *args, **kwargs)
        return wrapper
    
def check_open(func):
    def wrapper(self, *args, **kwargs):
        if not self.is_open:
            raise ValueError('account not open')
        return func(self, *args, **kwargs)
    return wrapper


class BankAccount:
    def __init__(self, balance=0):
        self.is_open = False
        self.balance = balance
        self.lock = Lock()

    @check_open
    def get_balance(self):
        return self.balance

    def open(self):
        if self.is_open:
            raise ValueError('account already open')
        self.is_open = True

    @apply_lock
    @check_open
    def deposit(self, amount):
        if amount < 0:
            raise ValueError('amount must be greater than 0')
        self.balance += amount

    @apply_lock
    @check_open
    def withdraw(self, amount):
        if amount < 0:
            raise ValueError('amount must be greater than 0')
        if self.balance - amount < 0:
            raise ValueError('amount must be less than balance')
        self.balance -= amount

    @check_open
    def close(self):
        self.balance = 0
        self.is_open = False
