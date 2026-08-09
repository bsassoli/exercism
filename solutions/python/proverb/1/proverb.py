def proverb(*words, qualifier=None):
    out = []
    if not words:
        return out
    first, *rest = words
    while len(rest) >= 1:
        second, *_ = rest
        out += [f"For want of a {first} the {second} was lost."]
        first, *rest = rest

    out += [f"And all for the want of a {qualifier} {words[0]}."] \
        if qualifier else [f"And all for the want of a {words[0]}."]
    return out
