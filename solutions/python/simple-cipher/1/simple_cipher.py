import random
from string import ascii_lowercase


class Cipher:
    def __init__(self, key=None):
        self.key = key if key else "".join(random.choices(ascii_lowercase, k=26))

    def encode(self, text):
        out = ""
        key = [ord(c) - ord('a') for c in self.key]
        for ix, char in enumerate(text):
            key_len = len(key)
            shift = key[ix % key_len]
            new_char = (ord(char) - 97 + shift) % 26 + 97
            out += chr(new_char)
        return out

    def decode(self, text):
        out = ""
        key = [ord(c) - ord('a') for c in self.key]
        for ix, char in enumerate(text):
            key_len = len(key)
            shift = key[ix % key_len]
            new_char = (ord(char) - 97 - shift) % 26 + 97
            out += chr(new_char)
        return out
