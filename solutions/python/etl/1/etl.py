LEGACY = {
    1: ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"],
    2: ["D", "G"],
    3: ["B", "C", "M", "P"],
    4: ["F", "H", "V", "W", "Y"],
    5: ["K"],
    8: ["J", "X"],
    10: ["Q", "Z"]
}


def transform(legacy_data):
    etl = {}
    values = []
    for list_of_values in legacy_data.values():
        values.append([value for value in list_of_values])
    values = [value for lst in values for value in lst]
    for value in values:
        for key, lst in LEGACY.items():
            if value.upper() in lst:
                etl[value.lower()] = key   
    return etl
        