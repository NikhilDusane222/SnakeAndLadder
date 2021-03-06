#!/bin/bash -x

printf "Welcome to Snake and Ladder game \n"
#Constants
POSITION=0
WINNING_POSITION=100
NO_PLAY=0
LADDER=1
SNAKE=2
#Variables 
position=0
dieCountForPlayer1=0
dieCountForPlayer2=0
positionForPlayer1=0
positionForPlayer2=0

#Winning condition
function playSnakeAndLadder()
{
	position=$1
	# Roll a die to get a random number between 1 to 6
	rollDieOutcome=$((RANDOM%6+1))
	optionCheck=$((RANDOM%3))
	#Check options Noplay/Ladder/Snake
	case $optionCheck in
		$NO_PLAY)
			position=$position
			;;
		$LADDER)
			# Exact winning condition
			if(( $((position+rollDieOutcome))>100  ))
			then
				position=$position
			else
				position=$((position+rollDieOutcome))
				position=$position
			fi
			;;
		$SNAKE)
			# Exact restart condition
			if(($position>$rollDieOutcome))
			then
				position=$((position-rollDieOutcome))
				position=$position
			else
				position=$POSITION
			fi
			;;
	esac
	echo $position
}

# Play till 100 for both players

while(($positionForPlayer1!=$WINNING_POSITION && $positionForPlayer2!=$WINNING_POSITION))
do
	((dieCountForPlayer1++))
	positionForPlayer1="$(playSnakeAndLadder $positionForPlayer1)"
	printf "Player 1 die count $dieCountForPlayer1 : Position $positionForPlayer1 \n"
	((dieCountForPlayer2++))
	positionForPlayer2="$(playSnakeAndLadder $positionForPlayer2)"
	printf "Player 2 die count $dieCountForPlayer1 : Position $positionForPlayer2 \n"
done

# Condition to know which player won

if(($positionForPlayer1==$WINNING_POSITION))
then
	printf "Congracts!!!!!player 1 won. you rolled the die for $dieCountForPlayer1 times \n"
else
	printf "Congracts!!!!!player 2 won. you rolled the die for $dieCountForPlayer2 times \n"
fi
