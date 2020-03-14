#!/bin/bash -x

# CONSTANTS FOR THE PROGRAM
isPartTime=1
isFullTime=2
maxHrsInMonth=4
empRatePerHr=20
numWorkingDays=20

# VARIABLES
totalWorkHours=0
totalWorkingDays=0

function getWorkingHours() {
	case $1 in
		$isFullTime)
			workHours=8 ;;
		$isPartTime)
			workHours=4 ;;
		*)
			workHours=0 ;;
	esac
	echo $workHours
}

function calcDailyWage(){
local workHrs=$1
wage=$(($workHrs * $empRatePerHr))
echo $wage 
}

while [[ $totalWorkHours -lt $maxHrsInMonth && 
			$totalWorkingDays -lt $numWorkingDays ]]
do
	((totalWorkingDays++))
	workHours="$( getWorkingHours $((RANDOM%3)) )"
	totalWorkHours=$(($totalWorkHours+$workHours))
	empDailyWage["$totalWorkingDays"]="$( calcDailyWage $workHours )"
done
	totalSalary="$( calcDailyWage $totalWorkHours )"
	echo "Daily Wage" ${empDailyWage[@]}
	echo "All Keys" ${!empDailyWage[@]}
