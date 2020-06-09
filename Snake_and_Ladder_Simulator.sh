#!/bin/bash -x

echo "Welcome to Snake and Ladder Simulation Program"

PLAYER=1
START_POSITION=0
NOPLAY=0
LADDER=1
SNAKE=2
WIN=100

new_position=$START_POSITION
roll_count=0

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

		if [ $new_position -lt $START_POSITION ]
                then
                        new_position=$START_POSITION
                fi

                ((roll_count++))
                player_Position[$roll_count]=$new_position

                if [ $new_position -eq $WIN ]
                then
                        break
                fi

	done
}

movement

for key in ${!player_Position[@]}
do
	echo "Player position when Dice rolled $key time is : ${player_Position[$key]}"
done

echo "The dice was played for $roll_count to win the game"
echo "Current position of player is at $new_position place"
echo "Congrats !!! You won the game..."
