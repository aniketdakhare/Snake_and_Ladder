#!/bin/bash -x

echo -e "Welcome to Snake and Ladder Simulation Program \n"

TOTAL_PLAYER=2
START_POSITION=0
NOPLAY=0
LADDER=1
SNAKE=2
WIN=100
P1_Position=0
P2_Position=0
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
        new_position=$1
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
        return $new_position
}


function play()
{
        while (( 2==2 ))
        do
                ((roll_count++))
                movement $P1_Position
                P1_Position=$?
                if [ $P1_Position -eq $WIN ]
                then
                        echo Player 1 won at move $roll_count
                        break
                fi
                movement $P2_Position
                P2_Position=$?
                if [ $P2_Position -eq $WIN ]
                then
                        echo Player 2 won at move $roll_count
                        break
                fi
        done
}

play
