#!/bin/bash
#path=/home/hbened01/
path=/home/johander/
file="copiacondc.csv"

awk '/"CONJ. RES."/' $path$file > $path"copiacondc.txt"
sed 's/",*/;/g' $path"copiacondc.txt" > $path"copiacondc2.txt"
sed 's/,;/;/g' $path"copiacondc2.txt" > $path"copiacondc3.txt"

tempApto=""
tempResi=""
tempGastos=""
tempFondos=""

while read line
do

	resi=$(echo  "$line" | cut -f28 -d';')
	if [ "$tempResi" != "$resi" ]
		then
		tempResi=$resi
	fi

	apto=$(echo  "$line" | cut -f26 -d';')
	if [ "$tempApto" != "$apto" ]
		then
		tempApto=$apto
		tempGastos=""
		propietario=$(echo  "$line" | cut -f30 -d';')
		mes=$(echo  "$line" | cut -f32 -d';')
		anio=$(echo  "$line" | cut -f33 -d';')
		echo "***********************************************************************"
		echo $resi - $apto - $propietario - $mes $anio
		echo "-----------------------------------------------------------------------"

		if [ "$tempApto" = "405" ]
			then
			echo $line
		fi

		fondo=$(echo  "$line" | cut -f56 -d';')
		if  [ "$fondo" = "Fondos" ]
			then
			echo ""
			echo "--------- $fondo --------"
			echo ""

			i=66
			j=0
			while [ "$(echo  "$line" | cut -f$i -d';')" != "" ]
			do
				#arr[$j]=$(echo  "$line" | cut -f$i -d';')
				echo $(echo  "$line" | cut -f$i -d';')
				i=`expr $i + 2`
				j=`expr $j + 1`
			done
		fi
	fi

	gastos=$(echo  "$line" | cut -f38 -d';')

	if [ "$tempGastos" != "$gastos" ]
		then
		tempGastos=$gastos
		echo ""
		echo "--------- $gastos --------"
		echo ""
	fi

	cpto=$(echo  "$line" | cut -f40 -d';')
	totalcpto=$(echo  "$line" | cut -f41 -d';')
	echo $cpto - $totalcpto

done < $path"copiacondc3.txt"