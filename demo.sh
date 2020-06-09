#!/bin/bash -x

echo -e "Welcome to Snake and Ladder Simulation Program \n"

TOTAL_PLAYER=2
START_POSITION=0
NOPLAY=0
LADDER=1
SNAKE=2
WIN=100

roll_count_1=0
roll_count_2=0

function winning_Condition()
{
        if [ $new_position -gt $WIN ]
        then
                 new_position=$(($new_position - $dice_Value))
        fi
}

function movement()
{
    dice_Value=$(($((RANDOM%6))+1))
    move=$((RANDOM%3))
    case $move in
        $NOPLAY)
            new_position=$(($new_position+$NOPLAY)) #This step can be removed
            ;;
        $LADDER)
            new_position=$(($new_position+$dice_Value))
            winning_Condition
            ;;
        $SNAKE)
            new_position=$(($new_position - $dice_Value))
            ;;
    esac
}

function game_condition()
{
        while (( $new_position <= $WIN ))
        do
                movement

                if [ $new_position -lt $START_POSITION ]
                then
                        new_position=$START_POSITION
                fi

                ((roll_count_"$player"++))
                #player_Position[$roll_count_"$player"]=$new_position

                if [ $new_position -eq $WIN ] || [ $roll_count_2 -gt $wa ]
                then
			if [ $((roll_count_"$player"))  -lt $wa ] || [ $wa -eq 0 ]
			then
				wa=$((roll_count_"$player"))
				winner=$player
				echo "Player $player took $wa moves to reach $WIN"
			fi
			break
                fi
        done
}

function players()
{
	wa=0
	winner=1
	for ((player=1; player<=$TOTAL_PLAYER; player++))
	do
		new_position=$START_POSITION
		game_condition
	done

	echo -e "\nCongrats Player $winner, you won the game !!!"
	echo -e "\nThe dice was played for $wa times to win the game"
}

players

#for key in ${!player_Position[@]}
#do
#       echo "Player position when Dice rolled $key time is : ${player_Position[$key]}"
#done
