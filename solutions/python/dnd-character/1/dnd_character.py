import random

abilities = [
    "charisma", 
    "strength", 
    "dexterity", 
    "constitution", 
    "intelligence", 
    "wisdom"
]

def modifier(attr):
    return (attr - 10) // 2

class Character:
    def __init__(self):
        for ability in abilities:
            setattr(
                self,
                ability,
                self.ability())
        self.hitpoints = 10 + modifier(self.constitution)
        
    def ability(self):
        return sum(sorted(random.choices(range(1, 7), k=4))[1:])