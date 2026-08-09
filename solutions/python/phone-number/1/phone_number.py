from string import punctuation


class PhoneNumber:
    def __init__(self, number):
        if number.startswith("+"):
            number = number[1:]
        if any(n.isalpha() for n in number):
            raise ValueError("letters not permitted")
        if any((n in ["@", ":", "!"]) for n in number):
            raise ValueError("punctuations not permitted")

        number_cleaned = "".join([n for n in number if n.isdigit()])

        if len(number_cleaned) < 10:
            raise ValueError("must not be fewer than 10 digits")

        # if a phone number has more than 11 digits.
        if len(number_cleaned) > 11:
            raise ValueError("must not be greater than 11 digits")

        # if a phone number has 11 digits, but starts with a number other than 1.
        if len(number_cleaned) == 11 and number_cleaned[0] != "1":
            raise ValueError("11 digits must start with 1")

        if len(number_cleaned) == 11:
            area_code_target = number_cleaned[1]
            exchange_code_target = number_cleaned[4]
        else:
            area_code_target = number_cleaned[0]
            exchange_code_target = number_cleaned[3]

        # if a phone number has an exchange code that starts with 0.
        if exchange_code_target == "0":
            raise ValueError("exchange code cannot start with zero")

        # if a phone number has an exchange code that starts with 1.
        if exchange_code_target == "1":
            raise ValueError("exchange code cannot start with one")

        # if a phone number has an area code that starts with 0.
        if area_code_target == '0':
            raise ValueError("area code cannot start with zero")
        elif area_code_target == '1':
            raise ValueError("area code cannot start with one")

        self.number = number_cleaned[-10:]
        self.area_code = self.number[:3]
        self.exchange_code = self.number[3:6]
        self.subscriber_number = self.number[6:]

    def pretty(self):
        return f"({self.area_code})-{self.exchange_code}-{self.subscriber_number}"
