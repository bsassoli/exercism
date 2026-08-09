def egg_count(display_value):
    if display_value == 0:
        return 0
    return display_value % 2 + egg_count(display_value // 2)
