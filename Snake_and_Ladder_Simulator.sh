#!/bin/bash -x

echo "Welcome to Snake and Ladder Simulation Program"

PLAYER=1
START_POSITION=0

function dice()
{
	dice_Value=$(($((RANDOM%6))+1))
}

dice

echo "Dice value is : $dice_Value"
