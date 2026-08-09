type planet = Mercury | Venus | Earth | Mars
            | Jupiter | Saturn | Neptune | Uranus

let age_on planet seconds =
    let yearsOnEarth =  (float_of_int seconds) /. 31557600.0 in
        match planet with
        | Earth -> yearsOnEarth
        | Mercury -> yearsOnEarth /. 0.2408467
        | Venus -> yearsOnEarth /. 0.61519726 
        | Mars -> yearsOnEarth /. 1.8808158
        | Jupiter -> yearsOnEarth /. 11.862615
        | Saturn -> yearsOnEarth /. 29.447498
        | Uranus -> yearsOnEarth /. 84.016846
        | Neptune -> yearsOnEarth /. 164.79132
