#!/bin/bash
for file in $( find . -name '*.h' ); 
do 
    filename=$( basename $file ); 
    sed -i s/\"$filename\"/\"$filename\"/I $( find . -name "*.cpp" -or -name "*.h" ); 
done 

