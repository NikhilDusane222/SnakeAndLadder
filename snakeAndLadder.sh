#!/bin/bash -x

printf "Welcome to Snake and Ladder game \n"

#Constants
POSITION=0
#Variables 
position=0
noPlay=0
ladder=1
snake=2
ladderCount=0
snakeCount=0

# Roll a die to get ranmdom number between 1 to 6
rollDieOutcome=$((RANDOM%6+1))
echo "Roll die outcome is:" $rollDieOutcome
#Winning condition
while(($position!=100))
do
	optionCheck=$((RANDOM%3))
	case $optionCheck in
		$noPlay)
			echo "Current position is:"$position
			echo "You stay in same position:"$position
			;;
		$ladder)
			((ladderCount++))
			echo "Current position is :" $position
			position=$((position+rollDieOutcome))
			echo "You encountered a ladder. new position is:" $position
			;;
		$snake)
			((snakeCount++))
			echo "Current position is :" $position
			position=$((position-rollDieOutcome))
			if(($position<0))
			then
				echo "You encountered a snake. new position is:" $POSITION
				position=$POSITION
			else
				echo "You encountered a snake. new position is:" $position
				position=$position
			fi
			;;
	esac
done
