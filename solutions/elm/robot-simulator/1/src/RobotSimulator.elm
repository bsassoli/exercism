module RobotSimulator exposing
    ( Bearing(..)
    , Robot
    , advance
    , defaultRobot
    , simulate
    , turnLeft
    , turnRight
    )


type Bearing
    = North
    | East
    | South
    | West


type Turn = 
    Right
    | Left

type Command = A | L | R

type alias Robot =
    { bearing : Bearing
    , coordinates : { x : Int, y : Int }
    }

changeBearing: Bearing -> Turn -> Bearing
changeBearing bearing direction =
    case bearing of 
        North -> case direction of
            Right -> East
            Left -> West
        South -> case direction of
            Right -> West
            Left -> East
        East -> case direction of
            Right -> South
            Left -> North
        West -> case direction of
            Right -> North
            Left -> South


defaultRobot : Robot
defaultRobot =
    { bearing = North
    , coordinates = { x = 0, y = 0 }
    }

turn : Robot -> Turn -> Robot
turn robot direction =
    {robot | bearing = changeBearing robot.bearing direction }

turnRight : Robot -> Robot
turnRight robot =
    turn robot Right

turnLeft : Robot -> Robot
turnLeft robot =
    turn robot Left

sendCommand: String -> Maybe Command
sendCommand cmd = 
    case cmd of 
        "A" -> Just A
        "R" -> Just R
        "L" -> Just L
        _ -> Nothing

moveRobot: Maybe Command -> Robot -> Robot 
moveRobot command robot = 
    case command of 
        Nothing -> robot
        Just A -> advance robot
        Just R -> turnRight robot
        Just L -> turnLeft robot        
        

 
advance : Robot -> Robot
advance robot =
    let 
        coords = robot.coordinates
        newCoords = 
            case robot.bearing of
                North -> 
                    {  coords | y = coords.y + 1 }
                South -> 
                    {  coords | y = coords.y - 1 }
                West -> 
                    {  coords | x = coords.x - 1 }
                East -> 
                    {  coords | x = coords.x + 1 }
    in { robot | coordinates = newCoords }

simulate : String -> Robot -> Robot
simulate directions robot =
    case String.toList directions of
        [] -> robot
        x::xs -> let command = sendCommand (String.fromChar x) in simulate (String.fromList xs) (moveRobot command robot)
 