#!/bin/bash

#                             UNLICENSE
#This is free and unencumbered software released into the public domain.

#Anyone is free to copy, modify, publish, use, compile, sell, or
#distribute this software, either in source code form or as a compiled
#binary, for any purpose, commercial or non-commercial, and by any
#means.

#In jurisdictions that recognize copyright laws, the author or authors
#of this software dedicate any and all copyright interest in the
#software to the public domain. We make this dedication for the benefit
#of the public at large and to the detriment of our heirs and
#successors. We intend this dedication to be an overt act of
#relinquishment in perpetuity of all present and future rights to this
#software under copyright law.

#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
#EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
#MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
#IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
#OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
#ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
#OTHER DEALINGS IN THE SOFTWARE.

#For more information, please refer to unlicense.org

function help {
    echo Converts a text file to Ducky Script
    echo
    echo Usage:
    echo \ \ \ \ txt2ducky InputFile [OutputFile]
    echo
    echo \ \ \ \ If [OutputFile] not specified it will default to InputFile.txt
    exit $1
}

[ -z $1 ]       && help 1
[ $1 = --help ] && help 0
[ $1 = -h ]     && help 0

filein=$1
if [ ! -z $2 ]; then
    fileout=$2
else
    fileout=$1.txt
fi

[ ! -e $filein ] && echo File not found: $filein && exit 1
[ -e $fileout ] && rm $fileout

echo Processing $filein...
while read -r line; do
    echo STRING $line >> $fileout
    echo ENTER        >> $fileout
done < $filein

echo Complete.

exit 0
