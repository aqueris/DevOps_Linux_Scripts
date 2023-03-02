#!/bin/bash
. ./../02/info.sh
. ./../03/color.sh
. ./../03/errors.sh
. ./params_output.sh

get_info

params=()

i=0
count=0
while read line
    do
    params[i]=`echo $line | awk -F '=' '{print $2}'`
    if [ $(is_integer ${params[i]}) = 'ok' ]
    then count=$(( $count + 1 ))
    fi
    i=$(( $i + 1 ))
done < config.conf


INPUT_ERROR="ok"

INPUT_ERROR=$(check_params_count  ${count})

if [ "$INPUT_ERROR" != "ok" ]
then echo $INPUT_ERROR
fi

errors_test="check_integer check_range check_equal"

for test in $errors_test
    do    
    if [ "$INPUT_ERROR" = "ok" ]
        then INPUT_ERROR=$($test ${params[0]} ${params[1]} \
                                 ${params[2]} ${params[3]})
        if [ "$INPUT_ERROR" != "ok" ]
        then echo $INPUT_ERROR
        fi
    fi
done

def_col=(1 2 4 1)

if [ "$INPUT_ERROR" = "ok" ]                  
then 
    get_text_color ${params[0]} ${params[1]} ${params[2]} ${params[3]}
    output_color_text
else
    get_text_color ${def_col[0]} ${def_col[1]} ${def_col[2]} ${def_col[3]}
    output_color_text
fi

params_output
