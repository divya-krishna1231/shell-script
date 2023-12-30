#!/bin/bash
x=0
for i in {1..10}
do
  x=$(($x+$i))
  # echo "$i"
  done
echo "sum is:: $x"
