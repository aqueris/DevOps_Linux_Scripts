#!/bin/bash

function output {
    if [ "$1" = 'S' ]
    then 
        for var in $list
        do
        echo "$var = $(eval echo \$$var)"
        done
    fi

    if [ "$1" = 'F' ]
    then
        FILE_NAME=`date +"%d_%m_%y_%H_%M_%S"`".status"
        echo "Result saved in file: $FILE_NAME"
        for var in $list
        do
        echo "$var = $(eval echo \$$var)" >> $FILE_NAME
        done
    fi
}