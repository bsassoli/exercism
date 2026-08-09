module Bandwagoner exposing (..)

type alias Coach = 
    { name : String
    , formerPlayer : Bool
    }

type alias Stats = 
    { wins : Int
    , losses : Int
    }

type alias Team = 
    { name : String
    , coach : Coach
    , stats: Stats
    }

replaceCoach : Coach -> Team -> Team
replaceCoach newCoach team =
    { team | coach = newCoach }


createTeam : String -> Stats ->  Coach -> Team
createTeam name stats coach =
    { name=name
    , stats=stats
    , coach=coach
    }

-- TODO: use an extensible record to accept any record that has a `stats: Stats` field
-- TODO: use pattern matching in the function parameter to get the `stats` field from the record
rootForTeam : {a | stats : Stats} -> Bool
rootForTeam {stats} =
    stats.wins > stats.losses
