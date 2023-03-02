#!/bin/bash

function params_output {

    colors=(nul white red green blue purple black)

    if [ "$INPUT_ERROR" = "ok" ]
    then
        echo
        echo "Column 1 background = ${params[0]} (${colors[${params[0]}]})"
        echo "Column 1 font color = ${params[1]} (${colors[${params[1]}]})"
        echo "Column 2 background = ${params[2]} (${colors[${params[2]}]})"
        echo "Column 2 font color = ${params[3]} (${colors[${params[3]}]})"
    else
        echo
        echo "Column 1 background = default (${colors[${def_col[0]}]})"
        echo "Column 1 font color = default (${colors[${def_col[1]}]})"
        echo "Column 2 background = default (${colors[${def_col[2]}]})"
        echo "Column 2 font color = default (${colors[${def_col[3]}]})"
    fi
}
