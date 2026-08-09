#!/usr/bin/env bash
main() {
    inpt=$1
    out=""
    (($inpt % 3 == 0)) && out+="Pling"
    (($inpt % 5 == 0)) && out+="Plang"
    (($inpt % 7 == 0)) && out+="Plong"
    echo "${out:-$1}"
}

main "$@"
