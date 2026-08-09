def decode(encoded_string):
    if not encoded_string:
        return ""
    
    decoded_string = ""
    i = 0
    
    while i < len(encoded_string):
        if encoded_string[i].isdigit():
            # Parse the number (which could be more than one digit)
            count = 0
            while i < len(encoded_string) and encoded_string[i].isdigit():
                count = count * 10 + int(encoded_string[i])
                i += 1
            
            # The next character should be the one to repeat
            if i < len(encoded_string):
                decoded_string += encoded_string[i] * count
                i += 1
        else:
            # If it's not a digit, it's a character to append as is
            decoded_string += encoded_string[i]
            i += 1
    
    return decoded_string


def encode(string):
    if not string: 
        return ""
    
    i = 0
    out = ""
    
    while i < len(string):
        current = string[i]
        counter = 1
        j = i + 1
        
        # Count the number of consecutive occurrences of the current character
        while j < len(string) and string[j] == current:
            counter += 1
            j += 1
        
        # Append the encoded part to the output
        if counter > 1:
            out += f"{counter}{current}"
        else:
            out += current
        
        # Move i to the next new character
        i = j
    
    return out
            
                