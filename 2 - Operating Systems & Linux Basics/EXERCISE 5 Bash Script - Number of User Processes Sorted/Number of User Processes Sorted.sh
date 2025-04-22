#Extend the previous script to ask additionally for user input about how many processes to print. Hint: use head program to limit the number of outputs. 


#!/bin/bash

read -p "Do you want to sort the processes by memory or cpu consumption? (mem/cpu): " sortby
read -p "How many processes do you want to show on screen?: " number_proc

if [ "$sortby" == "mem" ]
then
        ps aux --sort=-%mem | grep "$(echo $USER | cut -c1-7)" | head --lines=$number_proc
elif [ "$sortby" == "cpu" ]
then
        ps aux --sort=-%cpu | grep "$(echo $USER | cut -c1-7)" | head --lines=$number_proc
else
        echo "Invalid selection, please run the program again and enter one of the options mem or cpu."
        exit 1
fi
