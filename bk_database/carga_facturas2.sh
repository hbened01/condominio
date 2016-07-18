#! /bin/bash
path=/home/hbened01/
#path=/home/johander/
file="copiacondc.csv"

#sed -i '\n' $path$file
awk '/"CONJ. RES."/' $path$file > $path"copiacondc.txt"
#sed 's/\"//g' $path"copiacondc.txt" > $path"copiacondc2.txt"
sed 's/",*/;/g' $path"copiacondc.txt" > $path"copiacondc2.txt"
sed 's/,;/;/g' $path"copiacondc2.txt" > $path"copiacondc3.txt"

tempApto=""
tempResi=""
tempGastos=""
while read line
do
    echo $line
done < $path"copiacondc3.txt"