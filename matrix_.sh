#!/bin/bash

##Lets have a gap of 5 cols between each line
space=5
## This will clear the terminal and reset to the start point
echo -e "\033[2J\033[?25l";
## Get no.of rows and no.of cols of a terminal display
R=`tput lines` C=`tput cols`;
## As the terminal screen depends on the screen display size, have to calculate the final column number so that matrix doesnt look half-filled
cols=`echo $((C/space))`
e=echo\ -e s=sleep j=$[RANDOM%C] d=$[RANDOM%R]
## message :)
text="Good Morning"
## To frame the escape sequence and loop through as some have static text
counter=0
for j in `seq 1 $cols`;do
text0="\\\033["
text1="G\$t"
text2+=$text0$counter$text1
counter=$((counter+5))
done
#echo $text2
## So the loop executes until the no.of rows are covered. I'm not doing a continuous loop as it could be memory issue. But not much though. so lets retsrict
# with the limited iterations
for i in `eval $e {1..$R}`
do
## This would change the color of the terminal and lets stick to green - [32m as it could give atleast a real matrix look and feel
echo -e "\033[32m"
for a in `eval $e {$C..1}`
do
b=${a}G
c=$[a]+2'G'
## Okay, so here is a minimal trick where i want the entire text to be vertical and not horizontal. So break the string into char and print it.
for ((k=0; k<${#text}; k++))
do
#echo -e "\033[$z'G'${text:$k:1}\033[150G ${text:$k:1}"
t=${text:$k:1}
echo -e `eval echo "${text2}"`
sleep 0.1
done
done
sleep 0.1
done
## ---- THE END ---- ##
