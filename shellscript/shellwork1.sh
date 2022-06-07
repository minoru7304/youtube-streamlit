#!/bin/bash

#1 bashシェルのバージョンチェック
#bash --version

#2 
#which bash

#3
#echo "hello_world"

#4
#echo "hello_world" > testfile

#5
#find . -maxdepth 1 -name '*' | sort 

#10
STR="hello_world"
echo $STR

#11
echo echo "$0"
if [ ! $# -eq 1 ]
then 
    echo "$0" is necessary 1 argument
elif [ "$1" -gt 0 ]
then
    echo "True"
fi

#12
if [ ! "$#" -eq 3 ]
then 
    echo "$0" is necessary 3 argument
else
    for var in "$1" "$2" "$3"
    do
        echo "$var"
    done
fi

#13
while read LINE
do
    echo "$LINE"
done < ./testfile

#14
function myfunc() {
    echo "hello world"
}

myfunc