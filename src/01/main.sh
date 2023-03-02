#!/bin/bash

if [ $# -eq 0 ]                     #если число параметров = 0
    then echo "ERROR: No parameters found"
elif [ $# -gt 1 ]                   #если число параметров > 1
    then echo "ERORR: More parameters found"
elif [ $# -eq 1 ]                   #если число параметров = 1
    then
        check=`echo "$1" | grep -E ^\-?[0-9]*\.?[0-9]+$`
        if [ "$check" != '' ]  
        then echo "ERORR: $1 - is number"
        else echo "SUCCESS: $1"
        fi
fi
