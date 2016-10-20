#!/bin/bash 

#echo Hello World

rm -f pid.txt
echo "$$">>pid.txt

while :
do

luajit main.lua

sleep 1
done
