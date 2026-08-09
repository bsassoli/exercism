def flatten(iterable):
    def helper(iter):
        for item in iter:
            if item is None:
                continue
            if isinstance(item, (list, tuple)):
                for element in flatten(item):
                    yield element
            else:
                yield item
    return list(helper(iterable))
    