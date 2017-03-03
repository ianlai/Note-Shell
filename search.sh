#!/bin/bash

### Find a file 
find . -name abc    #filename abc
find . -name "*.py" #python files

### Find a string (pattern) in files
grep yo targetfile          #find "yo" in target file
grep -E "yo|zo" targetfile  #find "yo" or "zo" in target file

### Find a pattern in a directory
find . -name "*.rb" | xargs grep "yo" --color=AUTO  
