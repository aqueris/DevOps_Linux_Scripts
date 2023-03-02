#!/bin/bash

function get_folders {
    total_folders=`ls $path_name -lR | grep ^d | wc | awk '{print $1}'`
    echo "Total number of folders (including all nested ones) = $total_folders"
    echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
    du $path_name  -BM | sort  -nr | head -5 | awk '{print NR " - " $2 "/, " $1}'
}

function get_files {
    total_files=`ls $path_name -lR | grep ^- | wc | awk '{print $1}'`
    echo "Total number of files = $total_files"
    text_files=`ls $path_name -lR | grep ^- | grep ".txt"$ | wc | awk '{print $1}'`
    echo "Text files  = $text_files"
    conf_files=`ls $path_name -lR | grep ^- | grep ".conf"$ | wc | awk '{print $1}'`
    echo "Configuration files (with the .conf extension) = $conf_files"
    exe_files=`ls $path_name -lR | grep ^- | grep ".exe"$ | wc | awk '{print $1}'`
    echo "Executable files = $exe_files"
    log_files=`ls $path_name -lR | grep ^- | grep ".log"$ | wc | awk '{print $1}'`
    echo "Log files (with the extension .log) = $log_files"
    arh_files=`ls $path_name -lR | grep ^- | grep -e ".tar"$ -e ".gz"$ -e ".bz2"$ -e ".zip"$ -e ".7z"$ | wc | awk '{print $1}'`
    echo "Archive files = $arh_files"
}


function get_top_size_files {
    echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"

    for i in {1..10}
    do
        file_str=$(find $path_name -type f -exec du -h {} + | sort -rh | head -n 10  | cat -n | sed "${i}q;d")
        
        if [[ -n $file_str ]]
        then
            echo -n "$(echo $file_str | awk '{print $1 " - " $3 ", " $2}'), "
            echo $file_str | awk '{print $3}' | awk -F"." '{print $NF}'
        fi
    done  
}

function get_top_size_exe_files {
    echo -n "TOP 10 executable files of the maximum size arranged in descending order"
    echo "(path, size and MD5 hash of file)"

    for i in {1..10}
        do
            file_str=$(find $path_name -type f -name "*.exe" -exec du -h {} + | sort -rh | head -n 10  | cat -n | sed "${i}q;d")
            
            if [[ -n $file_str ]]
            then
                echo -n "$(echo $file_str | awk '{print $1 " - " $3 ", " $2}'), "
                file_name=$(echo $file_str | awk '{print $3}')
                echo $(md5sum $file_name | awk '{print $1}')
            fi
        done  

}

function check_dir {
    if [ "${path_name: -1}" != "/" ]
    then
        echo "The parameter must end with '/'"
    else 
        if [ -d $path_name ]
        then
            echo "OK"
        else
            echo "The $path_name directory does not exist"
        fi
    fi
}