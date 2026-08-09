comps = [
    ("house", "Jack built"),
    ("malt", "lay in"),
    ("rat", "ate"),
    ("cat", "killed"),
    ("dog", "worried"),
    ("cow with the crumpled horn", "tossed"),
    ("maiden all forlorn", "milked"),
    ("man all tattered and torn", "kissed"),
    ("priest all shaven and shorn", "married"),
    ("rooster that crowed in the morn", "woke"),
    ("farmer sowing his corn", "kept"),
    ("horse and the hound and the horn", "belonged to")
]

def recite(start_verse, end_verse):
    ans = []
    while start_verse <= end_verse:        
        seed = f"This is {generate_verse(start_verse)}"
        start_verse += 1
        ans.append(seed.strip() + ".")
    return ans

def generate_verse(line_number):
    if line_number == 0:
        return ""
    return f"the {comps[line_number -1][0]} that {comps[line_number - 1][1]} " + "".join(generate_verse(line_number - 1))