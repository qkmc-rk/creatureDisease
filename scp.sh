#!/bin/bash
npm run build
cp ./deploy.sh ./dist/deploy.sh
echo "copy deploy.sh finished"
localpath='./dist'
server='45.40.193.214'
port='21'
user='root'
serverpath='~'
echo "copying file to server"
scp -r -p $port $localpath $user@$server:$serverpath
echo "copying finished!"
echo "start deploy remote"
ssh -t root@45.40.193.214 "sh ~/dist/deploy.sh"
echo "deploy remote finished"