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
arrfondo=()
arrmontos=()

while read line
do

	resi=$(echo  "$line" | cut -f4 -d';')
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
		nr=$(echo  "$line" | cut -f11 -d';')
		tmpalicuota=$(echo  "$line" | cut -f31 -d';')
		alicuota=$(echo $tmpalicuota | cut -c 1),$(echo $tmpalicuota | cut -c 2-8)
		total_gmes=$(echo $(echo  "$line" | cut -f47 -d';') | sed 's/\.//g' )
		subtotal_gcom=$(echo $(echo  "$line" | cut -f49 -d';') | sed 's/\.//g' )
		total_pagar=$(echo $(echo  "$line" | cut -f53 -d';') | sed 's/\.//g' )
		rd=$(echo  "$line" | cut -f55 -d';')
		recibos=$(echo  "$rd" | cut -f1 -d',')
		deuda_actual=$(echo $(echo  "$rd" | cut -f2 -d',') | sed 's/\.//g' )
		echo "***********************************************************************"
		echo $resi - $apto - $propietario - $mes $anio - $nr - $alicuota - $total_gmes - $subtotal_gcom - $total_pagar - $recibos - $deuda_actual
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
			k=67
			while [ "$(echo  "$line" | cut -f$i -d';')" != "" ]
			do
				arrfondo[$j]=$(echo  "$line" | cut -f$i -d';')
				arrmontos[$j]=$(echo $(echo  "$line" | cut -f$k -d';') | sed 's/\.//g' )
				i=`expr $i + 2`
				j=`expr $j + 1`
				k=`expr $k + 2`
			done
			echo ${arrfondo[*]}
			echo ${arrmontos[*]}
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
	totalcpto=$(echo $(echo  "$line" | cut -f41 -d';') | sed 's/\.//g' )
	echo $cpto - $totalcpto

done < $path"copiacondc3.txt"