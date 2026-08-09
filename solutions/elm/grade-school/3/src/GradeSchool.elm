module GradeSchool exposing (Grade, Result(..), School, Student, addStudent, allStudents, emptySchool, studentsInGrade)

import Dict exposing (..)


type alias Grade =
    Int


type alias Student =
    String


type alias School =
    Dict Int (List Student)


type Result
    = Added
    | Duplicate


emptySchool : School
emptySchool =
    Dict.empty

getResult student school = 
    List.member student (allStudents school)


addStudentHelper: Grade -> Student -> School -> School
addStudentHelper grade student school = 
    Dict.insert grade (List.sort (student::studentsInGrade grade school)) school
    

addStudent : Grade -> Student -> School -> ( Result, School )
addStudent grade student school =
    let res = getResult student school in
    if res 
    then (Duplicate, school)
    else (Added, addStudentHelper grade student school)    


studentsInGrade : Grade -> School -> List Student
studentsInGrade grade school =
    case Dict.get grade school of
    Just students -> students
    Nothing -> []


allStudents : School -> List Student
allStudents school =
    Dict.map (\_ v -> List.sort v) school
    |> Dict.values
    |> List.foldr (++) [] 

