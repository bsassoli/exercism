def commands(binary_str):
    cmd = [instruction for instruction, ok in zip(["jump", "close your eyes", "double blink", "wink"], binary_str[1:]) if int(ok)]
    return cmd if int(binary_str[0]) else cmd[::-1]
            
