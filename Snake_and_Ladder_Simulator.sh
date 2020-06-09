#!/bin/bash -x

echo "Welcome to Snake and Ladder Simulation Program"

PLAYER=1
START_POSITION=0
NOPLAY=0
LADDER=1
SNAKE=2
new_position=$START_POSITION

function movement()
{
	dice_Value=$(($((RANDOM%6))+1))
	move=$((RANDOM%3))
	case $move in
		$NOPLAY)
			new_position+=0
			;;
		$LADDER)
			new_position=$(($new_position+$dice_Value))
			;;
		$SNAKE)
			new_position=$(($new_position - $dice_Value))
			;;
	esac
}

movement

echo "Current position of player is at $new_position place"
