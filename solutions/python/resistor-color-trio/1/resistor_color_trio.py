from math import log, floor

COLORS = {color: num for num, color in enumerate([
        "black", 
        "brown",
        "red",
        "orange",
        "yellow",
        "green",
        "blue",
        "violet",
        "grey",
        "white"
    ])}
    
PREFIXES = ["", "kilo", "mega", "giga", "tera", "peta", "exa", "zetta", "yotta"]

    
def label(colors):
    res = (COLORS[colors[0]] * 10 + COLORS[colors[1]]) * 10 ** COLORS[colors[2]]
    if not res:
        return '0 ohms'
    else:
        return  f'{res// 1000 ** floor(log(res, 1000))} {PREFIXES[floor(log(res, 1000))]}ohms'
        
    
    
