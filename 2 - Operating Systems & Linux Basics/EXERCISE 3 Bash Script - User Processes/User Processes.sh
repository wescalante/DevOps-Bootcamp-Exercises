#Write a bash script using Vim editor that checks all the processes running for the current user (USER env var) and prints out the processes in console. Hint: use ps aux command and grep for the user.


#!/bin/bash
#since my username is wescalante it´s 10 characters long, and the command ps truncates the usernames longer than 7 characters, so the output of the ps command
#is actually wescala+. To see all the processes related to my user I need to trucate $USER to 7 characters
ps aux | grep "$(echo $USER | cut -c1-7)"
