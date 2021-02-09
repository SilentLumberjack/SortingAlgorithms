#!/bin/bash
#
#script for sorting input arguments with insertion sort method

#here I created array from script input arguments 
array=( "$@" )

#to sort out array and avoid exessive operations we have to do n-1 walks through the array, where n in length of array
for ((permutations=1; permutations < "${#array[@]}"; permutations++))
do
	#here we should swap our elements if they arent in order of growth and repeat this operation from current element to the first element of array 
	#we should stop in case if next element will be smaller then current
	element=$permutations
	while [ $element -gt 0 ] && [ "${array[ $((element-1)) ]}" -gt "${array[$element]}" ]
	do
		tmp="${array[ $element ]}"
		array[ $element ]="${array[ $((element-1)) ]}"
		array[ $((element-1)) ]=$tmp
		element=$((element-1))
	done
done

echo "${array[@]}"
