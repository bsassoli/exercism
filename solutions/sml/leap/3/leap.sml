fun isLeapYear (year: int) = 
if (year mod 4 = 0) andalso (not (year mod 100 = 0) orelse (year mod 400 = 0))  then true else false
