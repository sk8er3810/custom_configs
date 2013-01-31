# This code is evil and must never be used!
    export IFS=" "
    [ -z "$3" ] && set -- "$1" "$2" 1
    FILES=`find "$1" -maxdepth "$3" -type f -printf "\"%p\" "`
    #printf -v FILES "%q" "`find "$1" -maxdepth "$3" -type f -printf "\"%p\" "`"
    #warning, evilness
    eval FILES=($FILES)
    for ((I=0; I < ${#FILES[@]}; I++))
    do
        printf -v sanitized "%q" "${FILES[I]}"
        eval "$2 $sanitized"
    done
    unset IFS
