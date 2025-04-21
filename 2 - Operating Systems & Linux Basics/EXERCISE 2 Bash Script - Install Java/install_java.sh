#!/bin/bash

#command to install the java jdk using apt package manager. Default-jdk will install the latest version for my system.
sudo apt install -y default-jdk
java -version

#check if java was installed at all
java_path=$(which java)
if [ -z "$java_path" ]
then
        echo "Java was not installed in the system. Please execute Install_Java.sh again"
else
        echo "Java was installed correctly. Checking the version..."
        #check the version that was installed if it is an older version lower than 11 or a newer version 11 or higher
        java_version_string=$(java -version 2>&1 | awk -F '"' '/version/ {print $2}')
        java_version=$(echo "$java_version_string" | awk -F. '{if ($1 == "1") print $2; else print $1}')
        if [ "$java_version" -ge 11 ]
        then
                echo "The version installed is $java_version. The installation process was a success."
        else
                echo "The version installed is $java_version. Even though java is installed, the version is too old. Please install java version 11 or higher."
        fi
fi
