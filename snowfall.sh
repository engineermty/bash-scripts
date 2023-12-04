#!/bin/bash

LINES=$(tput lines)
COLUMNS=$(tput cols)

declare -A snowflakes
declare -A lastflakes

clear

function move_flake() {
    i="$1"

    if [ "${snowflakes[$i]}" = "" ] || [ "${snowflakes[$i]}" = "$LINES" ]; then
        snowflakes[$i]=0
    else
        if [ "${lastflakes[$i]}" != "" ]; then
            printf "\033[%s;%sH \033[1;1H " ${lastflakes[$i]} $i
        fi
    fi

    printf "\033[%s;%sH\u274$[($RANDOM%6)+3]\033[1;1H" ${snowflakes[$i]} $i

    lastflakes[$i]=${snowflakes[$i]}
    snowflakes[$i]=$((${snowflakes[$i]}+1))
    echo -e "\033[33;5mMerry Christmas and Happy New Year 2024\033[0m"

}

while :
do
    i=$(($RANDOM % $COLUMNS))

    move_flake $i

    for x in "${!lastflakes[@]}"
    do
        move_flake "$x"
    done

    sleep 0.1
done

[ec2-user@ip-10-0-2-192 ~]$  
