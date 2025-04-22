#Extend the previous script to ask for a user input for sorting the processes output either by memory or CPU consumption, and print the sorted list.

#!/bin/bash

read -p "Do you want to sort the processes by memory or cpu consumption? (mem/cpu): " sortby

if [ "$sortby" == "mem" ]
then
        ps aux --sort=-%mem | grep "$(echo $USER | cut -c1-7)"
elif [ "$sortby" == "cpu" ]
then
        ps aux --sort=-%cpu | grep "$(echo $USER | cut -c1-7)"
else
        echo "Invalid selection, please run the program again and enter one of the options mem or cpu."
        exit 1
fi
