#!/bin/bash

echo "Calculating π using the Leibniz series..."

iterations=10000
pi=0
sign=1

for (( i=0; i<$iterations; i++ ))
do
    term=$(echo "scale=10; $sign * 4 / (2 * $i + 1)" | bc)
    pi=$(echo "scale=10; $pi + $term" | bc)
    sign=$(( -sign ))
done

echo "Approximate value of π: $pi"
