# Globals for the directions
# Change the values as you see fit
EAST = "E"
NORTH = "N"
WEST = "W"
SOUTH = "S"


class Robot:
    MOVE = {
            "N": {"R": EAST, "L": WEST},
            "S": {"R": WEST, "L": EAST},
            "W": {"R": NORTH, "L": SOUTH},
            "E": {"R": SOUTH, "L": NORTH}
        }
    ADVANCE = {
            NORTH: (0, 1),
            SOUTH: (0, -1),
            WEST: (-1, 0),
            EAST: (1, 0),
        }

    
    def __init__(self, direction=NORTH, x_pos=0, y_pos=0):
        self.direction=direction
        self.coordinates = (x_pos, y_pos)

    
    def _move(self, instruction):
        if instruction == "A": 
            self.coordinates = tuple(t[0] + t[1] for t in zip(self.coordinates, self.ADVANCE[self.direction]))
        else:
            self.direction = self.MOVE[self.direction][instruction]

    
    def move(self, instructions):
        for instruction in instructions:
            self._move(instruction)

    