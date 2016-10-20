#!/bin/bash 

kill -9 $(cat pid.txt)
rm -f pid.txt