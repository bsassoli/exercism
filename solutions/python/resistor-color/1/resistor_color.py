def color_code(color):
    colors_dict = {v: k for (k, v) in enumerate(colors())}
    return colors_dict[color]

def colors():
    return ["black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"]
