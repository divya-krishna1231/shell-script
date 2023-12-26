#!/bin/bash

PERSON=$1

if [ $PERSON -gt 100 ]
then
   echo "Give person $PERSON is greater than 100"
else
   echo "Give person $PERSON is not greater than 100"
fi