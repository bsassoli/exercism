#!/usr/bin/env bash

main()  {
sentence=${1//-/ }
sentence=${sentence//[[:punct:]]/}

for word in $sentence; do
    acronym+=${word:0:1}
done

echo "${acronym^^}"
}


main "$@"
