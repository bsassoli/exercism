def find(search_list, value):
    if not search_list:
        raise ValueError("value not in array")
    ix = len(search_list) // 2
    candidate = search_list[ix]
    if value == search_list[ix]:
        return ix
    if value < candidate:
        return find(search_list[:ix], value)
    return ix + 1 + find(search_list[ix + 1: ], value)
        
        
