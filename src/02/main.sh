#!/bin/bash
. ./info.sh
. ./output.sh

get_info

output "S"

read -p "Save result in file? (Yes or No):" user_answ
if [[ $user_answ = "y" ]] || [[ $user_answ = "Y" ]]
then 
    output "F"
fi
