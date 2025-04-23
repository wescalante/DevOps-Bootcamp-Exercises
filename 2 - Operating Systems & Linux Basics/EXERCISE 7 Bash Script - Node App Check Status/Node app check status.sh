#!/bin/bash

sudo apt install -y nodejs npm
echo "The version of nodejs is: $(nodejs --version)"
echo "The version of npm is: $(npm --version)"

wget https://node-envvars-artifact.s3.eu-west-2.amazonaws.com/bootcamp-node-envvars-project-1.0.0.tgz

tar -xzf bootcamp-node-envvars-project-1.0.0.tgz

export APP_ENV=dev
export DB_USER=myuser
export DB_PWD=mysecret

cd package

npm install
node server.js &
sleep 10
echo "The process is running and node is listening on port: $(sudo lsof -i -P -n | grep node)"
