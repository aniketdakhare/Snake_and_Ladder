#!/bin/bash -x

echo "Welcome to Snake and Ladder Simulation Program"

PLAYER=1
START_POSITION=0
NOPLAY=0
LADDER=1
SNAKE=2
WIN=100
new_position=$START_POSITION

function winning_Condition()
{
	if [ $new_position -gt $WIN ]
	then
		 new_position=$(($new_position - $dice_Value))
	fi
}

function movement()
{
	while (( $new_position <= $WIN ))
	do
		dice_Value=$(($((RANDOM%6))+1))
		move=$((RANDOM%3))
		case $move in
			$NOPLAY)
				new_position=$(($new_position+$NOPLAY))
				;;
			$LADDER)
				new_position=$(($new_position+$dice_Value))
				winning_Condition
				;;
			$SNAKE)
				new_position=$(($new_position - $dice_Value))
				;;
		esac

		if [ $new_position -eq $WIN ]
		then
			break
		elif [ $new_position -lt $START_POSITION ]
		then
			new_position=$START_POSITION
		fi
	done
}

movement

echo "Current position of player is at $new_position place"
echo "Congrats !!! You won the game..."
