
BOTTLES = ['No', 'One', 'Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eight', 'Nine', 'Ten']


def recite(start, take=1):
    out = []
    while take > 0:
        first = BOTTLES[start]
        second = BOTTLES[start - 1].lower()
        if first == "One":
            verses = [
                f"{first} green bottle hanging on the wall,",
                f"{first} green bottle hanging on the wall,",
                f"And if one green bottle should accidentally fall,",
                f"There'll be {second} green bottles hanging on the wall."
            ]
        elif first == "Two":
            verses = [
                f"{first} green bottles hanging on the wall,",
                f"{first} green bottles hanging on the wall,",
                f"And if one green bottle should accidentally fall,",
                f"There'll be {second} green bottle hanging on the wall."
            ]
        else:
            verses = [
                f"{first} green bottles hanging on the wall,",
                f"{first} green bottles hanging on the wall,",
                f"And if one green bottle should accidentally fall,",
                f"There'll be {second} green bottles hanging on the wall."
            ]
        for verse in verses:
            out.append(verse)
        if take > 1:
            out.append(f"")
        start -= 1
        take -= 1
    return out
