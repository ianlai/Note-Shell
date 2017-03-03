#!/bin/bash

### Arguments
echo $# # number of argument (not including the filename)
echo $@ # array of argument
echo $1 # first argument
echo $2 # second argument

### If condition
if [ $# != 0 ]; then
    echo "Argument."
else
    echo "No argument."
fi

### For loop (single line) 
for i in {0..100..20}; do echo $i ;done

### For loop 
for i in {1000..1020} 
do 
    echo $i 
done

### Parse the argument 
for var in $@
do 
    echo $var
    if [[ $var == "myset="* ]]; then
        MYSET=$(echo $var | cut -d'=' -f 2)
    fi
done
echo "MYSET: $MYSET" 
