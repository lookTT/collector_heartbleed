#!/bin/bash 

#luajit main.lua

#nohup sh collector.sh > /home/collector.log 2>&1 &

nohup sh collector.sh > /dev/null 2>&1 &
