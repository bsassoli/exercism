# TODO: define the 'EXPECTED_BAKE_TIME' constant
# TODO: define the 'PREPARATION_TIME' constant

EXPECTED_BAKE_TIME = 40
PREPARATION_TIME = 2
# TODO: define the 'bake_time_remaining()' function
def bake_time_remaining(n: int) -> int:
    """Calculate the bake time remaining.

    :param elapsed_bake_time: int baking time already elapsed.
    :return: int remaining bake time derived from 'EXPECTED_BAKE_TIME'.

    Function that takes the actual minutes the lasagna has been in the oven as
    an argument and returns how many minutes the lasagna still needs to bake
    based on the `EXPECTED_BAKE_TIME`.
    """
    return EXPECTED_BAKE_TIME - n

# TODO: define the 'preparation_time_in_minutes()' function
def preparation_time_in_minutes(layers: int) -> int:
    """ Returns preparation time in minutes.
    """
    return layers * PREPARATION_TIME
    
# TODO: define the 'elapsed_time_in_minutes()' function
def elapsed_time_in_minutes(number_of_layers, elapsed_bake_time): 
    """Returns elapsed time in minutes.
    """
    preparation_time = preparation_time_in_minutes(number_of_layers)
    return preparation_time + elapsed_bake_time

def total_time_in_minutes(number_of_layers, actual_bake_time):
    """Return elapsed cooking time.

    This function takes two numbers representing the number of layers & the time already spent 
    baking and calculates the total elapsed minutes spent cooking the lasagna.
    """
    preparation_time = preparation_time_in_minutes(number_of_layers)
    return preparation_time + bake_time_remaining(elapsed_bake_time)
    
    