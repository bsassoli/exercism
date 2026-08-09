def commands(binary_str):
    handshake = [instruction for instruction, yes_or_no in zip(["jump", "close your eyes", "double blink", "wink"], binary_str[1:]) if int(yes_or_no)]
    return handshake if int(binary_str[0]) else handshake[::-1]
