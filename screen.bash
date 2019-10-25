#!/usr/bin/env bash

__check_screen() {
    if [ "${TERM}" == "screen" ]
    then
        echo '${RED}SCREEN${NC}'
    fi
}

PS1="$(__check_screen) [\u@\h:\l \W]\\$ "
