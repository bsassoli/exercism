def line_up(name, number):
    ordinal = ""
    num_as_str = str(number)
    last_two_digits = num_as_str[-2:]
    last_digit = num_as_str[-1:]
    
    suffix = "th"
    if last_digit == "1" and not last_two_digits == "11":
        suffix = "st"
    if last_digit == "2" and not last_two_digits == "12":
        suffix = "nd"
    if last_digit == "3" and not last_two_digits == "13":
        suffix = "rd"
            
    ordinal = num_as_str + suffix
    msg = f"{name}, you are the {ordinal} customer we serve today. Thank you!"
    
    return msg
