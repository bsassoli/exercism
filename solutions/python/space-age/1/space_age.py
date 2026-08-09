class SpaceAge:
    ORBITS = {
        'mercury': 0.2408467,
        'venus': 0.61519726,
        'earth': 1.0,
        'mars': 1.8808158,
        'jupiter': 11.862615,
        'saturn': 29.447498,
        'uranus': 84.016846,
        'neptune': 164.79132,
    }
    def __init__(self, seconds):
        self.seconds = seconds
        for planet in SpaceAge.ORBITS:
             setattr(self, 'on_' + planet, self.attr_planets(planet))

    def attr_planets(self, planet):
                return lambda planet=planet: round(self.seconds / 31557600 / SpaceAge.ORBITS[planet], 2)
        
    