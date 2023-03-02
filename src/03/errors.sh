#!/bin/bash

function check_range {
    local result=1
    if [[ $1 -lt 1 ]] || [[ $1 -gt 6 ]]
        then result=$(( $result * 0 ))
    fi
    if [[ $2 -lt 1 ]] || [[ $2 -gt 6 ]]
        then result=$(( $result * 0 ))
    fi
    if [[ $3 -lt 1 ]] || [[ $3 -gt 6 ]]
        then result=$(( $result * 0 ))
    fi
    if [[ $4 -lt 1 ]] || [[ $4 -gt 6 ]]
        then result=$(( $result * 0 ))
    fi    
    if [ $result -eq 1 ]
    then echo ok
    else echo "ERROR: Color param out of range"
    fi
}

function is_integer {
    check=`echo "$1" | grep -E ^\-?[0-9]+$`
    if [ "$check" != '' ]  
    then echo "ok"
    else echo "no"
    fi
}

function check_integer {
    local result=1
    if [ "$(is_integer $1)" = "no" ]
        then result=$(( $result * 0 ))
    fi
    if [ "$(is_integer $2)" = "no" ]
        then result=$(( $result * 0 ))
    fi
    if [ "$(is_integer $3)" = "no" ]
        then result=$(( $result * 0 ))
    fi
    if [ "$(is_integer $4)" = "no" ]
        then result=$(( $result * 0 ))
    fi    
    if [ $result -eq 1 ]
    then echo "ok"
    else echo "ERROR: Param is not integer"
    fi
} 

function check_params_count {
    if [ $1 -eq 0 ]                     
        then echo "ERROR: No parameters found"
    elif [ $1 -gt 4 ]                   
        then echo "ERORR: More parameters found"
    elif [ $1 -lt 4 ]                   
        then echo "ERORR: Few parameters found"
        else echo "ok"
    fi
}

function check_equal {
    if [[ $1 -eq $2 ]] || [[ $3 -eq $4 ]]
        then echo "ERROR: Colors for text and background is equal"
        else echo "ok"
    fi
}