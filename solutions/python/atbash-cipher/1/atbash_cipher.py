
import string

plain = "abcdefghijklmnopqrstuvwxyz"
cipher = "zyxwvutsrqponmlkjihgfedcba"
encoder = str.maketrans(plain, cipher)
decoder = str.maketrans(cipher, plain)
punct = str.maketrans('', '', string.punctuation)

def encode(plain_text):
    cleaned_plain_text = "".join(plain_text.lower().translate(punct).split())
    encoded = list(cleaned_plain_text.translate(encoder))
    spaced = ""
    i = 0
    while encoded:
        char = encoded.pop(0)
        spaced += char
        i += 1
        if i % 5 == 0:
            spaced += " "
    return spaced.strip()
   
def decode(ciphered_text):
    no_spaces = "".join(ciphered_text.split())
    decoded = no_spaces.translate(decoder)
    return decoded
