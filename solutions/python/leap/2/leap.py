def leap_year(year):
    return (not year % 100 == 0 or year % 400 == 0) and year % 4 == 0
