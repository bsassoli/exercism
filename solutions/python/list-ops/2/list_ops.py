def append(list1, list2):
    return list1 + list2


def concat(lists):
    if not lists:
        return []
    if isinstance(lists[0], list):
        return [item for item in lists[0]]+ concat(lists[1:])
    return [lists[0]] + concat(lists[1:])


def filter(function, list):
    return [x for x in list if function(x)]


def length(list):
    if not list:
        return 0
    return 1 + length(list[1:])


def map(function, list):
    return [function(x) for x in list]
    


def foldl(function, list, initial):
    if not list:
        return initial
    return foldl(function, list[1:], function(initial, list[0]))


def foldr(function, list, initial):
    return foldl(function, reverse(list), initial)


def reverse(list):
    return list[::-1]
