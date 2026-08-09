from typing import Tuple
# Globals for the directions
# Change the values as you see fit
EAST: str = "E"
NORTH: str= "N"
WEST: str = "W"
SOUTH: str = "S"

class Robot:
    MOVE: dict[str, dict[str, str]] = {
        "N": {"R": EAST, "L": WEST},  # From North, right turns to East, left turns to West
        "S": {"R": WEST, "L": EAST},  # From South, right turns to West, left turns to East
        "W": {"R": NORTH, "L": SOUTH},  # From West, right turns to North, left turns to South
        "E": {"R": SOUTH, "L": NORTH}  # From East, right turns to South, left turns to North
    }
    
    ADVANCE: dict[str, tuple[int, int]] = {
        NORTH: (0, 1),  # Moving North increases y-coordinate
        SOUTH: (0, -1),  # Moving South decreases y-coordinate
        WEST: (-1, 0),  # Moving West decreases x-coordinate
        EAST: (1, 0),  # Moving East increases x-coordinate
    }
    
    def __init__(self, direction: str = NORTH, x_pos: int = 0, y_pos: int = 0) -> None:
        self.direction: str = direction  # Set the initial direction
        self.coordinates: Tuple[int, int] = x_pos, y_pos  # Set the initial coordinates
    
    def _move(self, instruction: str) -> None:
        if instruction == "A": 
            # Advance in the current direction
            self.coordinates = tuple(t[0] + t[1] for t in zip(self.coordinates, self.ADVANCE[self.direction]))
        else:
            # Turn right or left
            self.direction = self.MOVE[self.direction][instruction]

    def move(self, instructions: str) -> None:
        for instruction in instructions:
            self._move(instruction)