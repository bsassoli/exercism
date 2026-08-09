def value(colors):
    color_codes = {v: str(k) for (k, v) in enumerate(["black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"])}
    return int("".join([color_codes[color] for color in colors[:2]]))
