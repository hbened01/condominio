#! /bin/bash
#path=/home/jvazqu03/
path=/home/johander/
file="copiacondc.csv"

#sed -i '\n' $path$file
awk '/"CONJ. RES."/' $path$file > $path"copiacondc.txt"
sed 's/\"//g' $path"copiacondc.txt" > $path"copiacondc2.txt"

tempApto=""
tempResi=""
tempGastos=""
while read line
do
	#$campo = `cut -d "," -f 1 $path$file`

	resi=$(echo  "$line" | cut -f2 -d',')
	if [ "$tempResi" != "$resi" ]
		then
		tempResi=$resi
	fi

	apto=$(echo  "$line" | cut -f14 -d',')
	if [ "$tempApto" != "$apto" ]
		then
		tempApto=$apto
		tempGastos=""
		apellido=$(echo  "$line" | cut -f16 -d',')
		nombre=$(echo  "$line" | cut -f17 -d',')
		mes=$(echo  "$line" | cut -f19 -d',')
		anio=$(echo  "$line" | cut -f20 -d',')
		echo "***********************************************************************"
		echo $resi - $apto - $nombre $apellido - $mes $anio
		echo "-----------------------------------------------------------------------"

		if [ "$tempApto" = "405" ]
			then
			echo $line
		fi
	fi

	gastos=$(echo  "$line" | cut -f23 -d',')
	cpto=$(echo  "$line" | cut -f24 -d',')

	if [ "$tempGastos" != "$gastos" ]
		then
		tempGastos=$gastos
		if [ "$tempGastos" = "Monto" ]
			then
			echo ""
			echo "--------- $cpto --------"
			echo ""
		else
			echo ""
			echo "--------- $gastos --------"
			echo ""
		fi
	fi

	if [ "$cpto" = "Gastos Comunes" ]
		then
		cpto=$(echo  "$line" | cut -f25 -d',')
		totalcpto=$(echo  "$line" | cut -f26 -d',')
	else
		totalcpto=$(echo  "$line" | cut -f25 -d',')
	fi
	echo $cpto - $totalcpto

	fondo=$(echo  "$line" | cut -f40 -d',')
	if [ "$tempApto" != "$apto" ] && [ "$fondo" = "Fondos" ]
		then
		echo ""
		echo "--------- $fondo --------"
		echo ""
	fi
done < $path"copiacondc2.txt"