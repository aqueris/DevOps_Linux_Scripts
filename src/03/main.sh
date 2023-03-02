#!/bin/bash
. ./../02/info.sh
. ./errors.sh
. ./color.sh

get_info

INPUT_ERROR="ok"
INPUT_ERROR=$(check_params_count $#)

if [ "$INPUT_ERROR" != "ok" ]
then echo $INPUT_ERROR
fi

errors_test="check_integer check_range check_equal"

for test in $errors_test
    do    
    if [ "$INPUT_ERROR" = "ok" ]
        then INPUT_ERROR=$($test $1 $2 $3 $4)
        if [ "$INPUT_ERROR" != "ok" ]
        then echo $INPUT_ERROR
        fi
    fi
done

if [ "$INPUT_ERROR" = "ok" ]                  
then 
    get_text_color $1 $2 $3 $4

    output_color_text
fi
