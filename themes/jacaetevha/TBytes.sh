#!/bin/bash
#Sum the number of bytes in a directory listing
TBytes=0
# swap the next two lines in order to get a summary with the sizes of directories as well
#for Bytes in $(ls -l | awk '{ print $5 }')
for Bytes in $(ls -l | grep "^-" | awk '{ print $5 }')
do
    let TBytes=$TBytes+$Bytes
done

Total=$(echo -e "scale=3 \n$TBytes/1048576 \nquit" | bc)
Units=" Mb"
if [[ TBytes -lt 1048576 ]]
then
    Total=$(echo -e "scale=3 \n$TBytes/1048 \nquit" | bc)
    Units=" Kb"
fi
echo -n "$Total$Units"
