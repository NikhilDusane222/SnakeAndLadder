#!/bin/bash -x

printf "Welcome to Snake and Ladder game \n"

#Variables
position=0

# Roll a die to get ranmdom number between 1 to 6
rollDieOutcome=$((RANDOM%6+1))
echo $rollDieOutcome
