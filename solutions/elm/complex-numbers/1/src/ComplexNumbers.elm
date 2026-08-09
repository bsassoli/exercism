module ComplexNumbers exposing
    ( Complex
    , abs
    , add
    , conjugate
    , div
    , exp
    , fromPair
    , fromReal
    , imaginary
    , mul
    , real
    , sub
    )


type alias Complex
    = {a: Float, b: Float}


fromPair : ( Float, Float ) -> Complex
fromPair (a, b) =
    Complex a b


fromReal : Float -> Complex
fromReal n =
    Complex n 0.0


real : Complex -> Float
real z =
    z.a


imaginary : Complex -> Float
imaginary z =
    z.b


conjugate : Complex -> Complex
conjugate z =
    Complex z.a -z.b


abs : Complex -> Float
abs z =
    sqrt (z.a^2 + z.b^2)


add : Complex -> Complex -> Complex
add z1 z2 =
    Complex (z1.a + z2.a) (z1.b + z1.b) 


sub : Complex -> Complex -> Complex
sub z1 z2 =
    Complex (z1.a - z2.a) (z1.b - z1.b) 


mul : Complex -> Complex -> Complex
mul z1 z2 =
    Complex (z1.a * z2.a - z1.b * z2.b) (z1.b * z2.a + z1.a * z2.b)


div : Complex -> Complex -> Complex
div z1 z2 =
    Complex ((z1.a * z2.a + z1.b * z2.b)/(z2.a^2 + z2.b^2)) ((z1.b * z1.a - z1.a * z2.b)/(z1.a^2 + z1.b^2))


exp : Complex -> Complex
exp z =
    Complex ((cos z.b)*e^z.a) ((sin z.b)*e^z.a)
