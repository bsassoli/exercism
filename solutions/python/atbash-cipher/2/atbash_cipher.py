
import string

plain = "abcdefghijklmnopqrstuvwxyz"
cipher = "zyxwvutsrqponmlkjihgfedcba"
encoder = str.maketrans(plain, cipher)
decoder = str.maketrans(cipher, plain)
punct = str.maketrans('', '', string.punctuation)

def encode(plain_text):
    cleaned_plain_text = "".join(plain_text.lower().translate(punct).split())
    encoded = cleaned_plain_text.translate(encoder)
    return " ".join([encoded[ix: ix+5] for ix in range(0, len(encoded), 5)])

def decode(ciphered_text):
    no_spaces = "".join(ciphered_text.split())
    decoded = no_spaces.translate(decoder)
    return decoded
