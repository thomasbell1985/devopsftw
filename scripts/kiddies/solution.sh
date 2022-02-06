#!/bin/bash
FILE=$1
LINE_LENGTH=$2

if ! [[ "$LINE_LENGTH" =~ ^[0-9]+$ ]]
# This check was gleaned from a stack exchange post from the link gelow, to ensure that the line length
# is a valid number
# https://unix.stackexchange.com/questions/151654/checking-if-an-input-number-is-an-integer
then
    echo "Invalid line length parameter. Line length must be an integer greater than 0. Value of $LINE_LENGTH, given"
    exit 1
fi
if test -f "$FILE"
then
    # The sed portion of this script was gleaned from the stack overflow post linked below
    # https://stackoverflow.com/questions/1251999/how-can-i-replace-each-newline-n-with-a-space-using-sed
    awk -v val=$LINE_LENGTH 'length($0) > val' $FILE | sed -e ':a' -e 'N' -e '$!ba' -e 's/\n/\t/g'
else
    echo "no file of name: $FILE found"
fi
