#!/bin/bash
. ./lib.sh

time=$(date +%N)
path_name=$1

ERROR=$(check_dir)

if [ "$ERROR" = "OK" ]
then
    get_folders
    get_files
    get_top_size_files
    get_top_size_exe_files

    time=$(($(date +%N)-$time))
    time=$(bc<<<"scale=1; $time/1000/1000/1000")""
    echo "Script execution time (in seconds) = $time"
else
    echo $ERROR
fi
