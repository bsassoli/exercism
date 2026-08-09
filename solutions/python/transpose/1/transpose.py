from itertools import zip_longest


def transpose(lines):
    lines = "\n".join("".join(line).rstrip("*").replace("*", " ") for line in\
                      zip_longest(*lines.splitlines(), fillvalue="*"))
    return lines
