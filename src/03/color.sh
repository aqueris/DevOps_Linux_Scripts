#!/bin/bash

# Цвет текста / фона:
#  0 - DEF 39/49       
#  1 - WHITE 37/47      
#  2 - RED 31/41      
#  3 - GREEN 32/42    
#  4 - BLUE 34/44     
#  5 - PURPLE 35/45     
#  6 - BLACK 30/40


function get_color {
    COLOR_CODE=(9 7 1 2 4 5 0)
    echo "\033[0;4${COLOR_CODE[${1}]};3${COLOR_CODE[${2}]}m"
}

function get_text_color {
    VARCOL="$(get_color ${1} ${2})"
    VALCOL="$(get_color ${3} ${4})"
    DEFCOL="$(get_color 0 0)"
}

function output_color_text {
    for var in $list
    do
        echo -e "${VARCOL}${var}$DEFCOL = ${VALCOL}$(eval echo \$$var)$DEFCOL"
    done
}