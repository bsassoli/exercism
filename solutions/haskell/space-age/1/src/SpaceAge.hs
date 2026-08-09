module SpaceAge (Planet(..), ageOn) where

data Planet = Mercury
            | Venus
            | Earth
            | Mars
            | Jupiter
            | Saturn
            | Uranus
            | Neptune

ageOn :: Planet -> Float -> Float
ageOn planet seconds = case planet of
  Earth -> yearsOnEarth
  Mercury -> yearsOnEarth / 0.2408467
  Venus -> yearsOnEarth / 0.61519726 
  Mars -> yearsOnEarth / 1.8808158
  Jupiter -> yearsOnEarth / 11.862615
  Saturn -> yearsOnEarth / 29.447498
  Uranus -> yearsOnEarth / 84.016846
  Neptune -> yearsOnEarth / 164.79132
  where yearsOnEarth = seconds / 31557600.0

