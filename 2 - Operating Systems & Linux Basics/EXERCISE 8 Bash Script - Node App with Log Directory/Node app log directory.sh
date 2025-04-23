#!/bin/bash

sudo apt update
sudo apt install -y nodejs npm
echo "The version of nodejs is: $(nodejs --version)"
echo "The version of npm is: $(npm --version)"

wget https://node-envvars-artifact.s3.eu-west-2.amazonaws.com/bootcamp-node-envvars-project-1.0.0.tgz

tar -xzf bootcamp-node-envvars-project-1.0.0.tgz

export APP_ENV=dev
export DB_USER=myuser
export DB_PWD=mysecret

cd package

echo "Please enter the name of the folder where logs should be saved. You must provide the full path"
read -p "You can enter the name of an existing folder or a new one—if it doesn't exist, it will be created automatically: " log_directory

if [ -d "$log_directory" ]
then
        echo "The folder $log_directory already exists"
else
        echo "The folder $log_directory doesn´t exist. Creating folder..."
        mkdir "$log_directory"
fi

export LOG_DIR="$log_directory"

npm install
node server.js &
sleep 10

echo "The process is running and node is listening on port: $(sudo lsof -i -P -n | grep node)"
