def rotate(text, key):    
    return "".join(map(lambda c: shift_char(c, key=key), text))

def shift_char(ch, key):
    if ch.isalpha():
        modifier = 97 if ch.islower() else 65
        return chr(((ord(ch) - modifier + key) % 26) + modifier)
    return ch
    
    