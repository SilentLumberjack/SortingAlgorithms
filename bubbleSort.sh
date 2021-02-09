#!/bin/bash
#
#script for sorting input arguments with bubble sort method

#here I created array from script input arguments 
array=( "$@" )

#to sort out array and avoid exessive operations we have to do n-1 walks through the array, where n in length of array
for ((permutations=1; permutations < "${#array[@]}"; permutations++))
do
	#for every race, we have do decrement number of permutations, because in bubble sort our arrays tale is already sorted
	for ((element=0; element < $(("${#array[@]}" - permutations)); element++))
	do
		#we simply swap variables if they arent in order of growth
		if [[ "${array[ $element ]}" -gt "${array[ $((element + 1)) ]}" ]];then
			tmp="${array[ $element ]}"
			array[ $element ]="${array[ $((element+1)) ]}"
			array[ $((element+1)) ]=$tmp
		fi
	done

done

echo "${array[@]}"
