from string import ascii_uppercase as ALPHABET

def rows(letter):
    target_ix = ALPHABET.index(letter)
    if target_ix == 0:
        return ["A"]
    out = []
    vertex =  " " * (target_ix) 
    vertex += "A"
    vertex += " " * (target_ix)
    out.append(vertex)
    curr_ix = 1
    outer_mult = 1
    while curr_ix < target_ix:
        out_str = ""
        outer_dots = " " * (target_ix - curr_ix)
        out_str += outer_dots + ALPHABET[curr_ix]
        inner_dots = " " * outer_mult
        out_str += inner_dots + ALPHABET[curr_ix] + outer_dots
        curr_ix += 1
        outer_mult += 2
        out.append(out_str)
    outer_dots = " " * (target_ix - curr_ix)
    inner_dots = " " * outer_mult
    middle = outer_dots + ALPHABET[curr_ix] + inner_dots + ALPHABET[curr_ix] + outer_dots    
    return out + [middle] + out[::-1]

print(rows("A"))
