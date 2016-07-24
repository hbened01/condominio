#!/bin/bash
#path=/home/hbened01/
path=/home/johander/
file="copiacondc.csv"

awk '/"CONJ. RES."/' $path$file > $path"copiacondc.txt"
sed 's/",*/;/g' $path"copiacondc.txt" > $path"copiacondc2.txt"
sed 's/,;/;/g' $path"copiacondc2.txt" > $path"copiacondc3.txt"

#--- Database information ----------------
hots=127.0.0.1
db_name=condominio_db
user=hjtecnos
export PGPASSWORD='<zaq12wsx'
#-----------------------------------------

tempApto=""
tempResi=""
arrgnc=()
g=0
flag=0
flag2=0
flag3=0
flag4=0

while read line
do

	resi=$(echo  "$line" | cut -f4 -d';')
	if [ "$tempResi" != "$resi" ]
		then
		tempResi=$resi
	fi

	apto=$(echo  "$line" | cut -f26 -d';')
	mes=$(echo  "$line" | cut -f32 -d';')
	anio=$(echo  "$line" | cut -f33 -d';')

	#--------- If it already exists ---------------------
	if [ $flag4 = 0 ] 
		then
		query="SELECT COUNT(*) FROM facturas WHERE cod_apto='$apto' AND fecha='$mes $anio';"
		result=$(echo $query | psql -h $hots -U $user -d $db_name)
		rid=$(echo $result | cut -f3 -d' ')

		if [ $rid != 0 ] && [ $flag4 = 0 ]
			then
			echo "Ya se cargo"
			exit $?
		else
			flag4=1
		fi
	fi
	#----------------------------------------------------

	if [ "$tempApto" != "$apto" ]
		then
		flag2=0
		flag3=0
		tempApto=$apto
		propietario=$(echo  "$line" | cut -f30 -d';')
		#nombre=$(echo  "$propietario" | cut -f2 -d',')
		#apellido=$(echo  "$propietario" | cut -f1 -d',')
		nr=$(echo  "$line" | cut -f11 -d';')
		tmpalicuota=$(echo  "$line" | cut -f31 -d';')

		alicuota=$(echo $tmpalicuota | cut -c 1).$(echo $tmpalicuota | cut -c 2-8)
		if [ "$alicuota" = "" ] 
			then alicuota=0 
		fi

		total_gmes=$(echo $(echo  "$line" | cut -f47 -d';') | sed 's/\.//g')
		if [ "$total_gmes" = "" ] 
			then total_gmes=0 
		fi
			
		subtotal_gcom=$(echo $(echo  "$line" | cut -f49 -d';') | sed 's/\.//g')
		if [ "$subtotal_gcom" = "" ] 
			then subtotal_gcom=0 
		fi
			
		total_pagar=$(echo $(echo  "$line" | cut -f53 -d';') | sed 's/\.//g')
		if [ "$total_pagar" = "" ] 
			then total_pagar=0 
		fi
			
		rd=$(echo  "$line" | cut -f55 -d';')

		recibos=$(echo  "$rd" | cut -f1 -d',')
		if [ "$recibos" = "" ] 
			then recibos=0 
		fi
			
		deuda_actual=$(echo $(echo  "$rd" | cut -f2 -d',') | sed 's/\.//g')
		if [ "$deuda_actual" = "" ] 
			then deuda_actual=0 
		fi
			
		echo "***********************************************************************"
		echo $resi - $apto - $propietario - $mes $anio - $nr - $alicuota - $total_gmes - $subtotal_gcom - $total_pagar - $recibos - $deuda_actual
		echo "-----------------------------------------------------------------------"

		#-------- Insert in the facturas table and get id ----------------------------
		query="INSERT INTO facturas(
			            cod_apto, edificio, nombre, apellido, alicuota, 
			            nr, fecha, total_gastos_mes, sub_total_alicuota, total_pagar_mes, 
			            deuda_actual, recibos)
			    VALUES ('$apto', '$resi', '$propietario', '', $alicuota, 
			            $nr, '$mes $anio', $total_gmes, $subtotal_gcom, $total_pagar, 
			            $deuda_actual, $recibos) RETURNING cd_factura_pk;"
		id_factura=$(echo $query | psql -h $hots -U $user -d $db_name)
		fid=$(echo $id_factura | cut -f3 -d' ')
		echo $fid
		#-----------------------------------------------------------------------------

		# if [ "$tempApto" = "03A" ]
		# 	then
		# 	echo $line
		# fi

		fondo=$(echo  "$line" | cut -f56 -d';')
		if  [ "$fondo" = "Fondos" ]
			then

			i=66
			j=0
			k=67
			while [ "$(echo  "$line" | cut -f$i -d';')" != "" ]
			do
				arrfondo=$(echo  "$line" | cut -f$i -d';')
				arrmontos=$(echo $(echo  "$line" | cut -f$k -d';') | sed 's/\.//g')

				#-------- Insert in the fondos table ---------------------------------------
				query="INSERT INTO fondos(
					            cod_factura_fk, descripcion, saldo_anterior, cota_mes, 
					            cargo, saldo_actual)
					    VALUES ($fid,'$arrfondo',$arrmontos);"
				q=$(echo $query | psql -h $hots -U $user -d $db_name)
				#---------------------------------------------------------------------------

				i=`expr $i + 2`
				j=`expr $j + 1`
				k=`expr $k + 2`
			done
		fi
	fi

	gastos=$(echo  "$line" | cut -f38 -d';')

	cpto=$(echo  "$line" | cut -f40 -d';')
	totalcpto=$(echo $(echo  "$line" | cut -f41 -d';') | sed 's/\.//g')
	if [ $totalcpto = "" ] 
		then totalcpto=0 
	fi

	if [ "$gastos" = "Gastos Comunes" ] && [ $flag = 0 ]
		then
		#-------- Insert in the gastos_comunes table and get id ----------------------
		query="INSERT INTO gastos_comunes(descripcion, monto)
			    VALUES ('$cpto', $totalcpto) RETURNING cd_gasto_comun_pk;"
		id_gnc=$(echo $query | psql -h $hots -U $user -d $db_name)
		arrgnc[$g]=$(echo $id_gnc | cut -f3 -d' ')
		g=`expr $g + 1`
		#-----------------------------------------------------------------------------
	elif [ "$gastos" = "Gastos no Comunes" ] 
		then
		if [ $flag = 0 ]
			then
			flag=1
		fi
		flag3=1
		#-------- Insert in the gastos_nocomunes table -------------------------------
		query="INSERT INTO gastos_nocomunes(cod_factura_fk, descripcion, monto)
			    VALUES ($fid, '$cpto', $totalcpto);"
		q=$(echo $query | psql -h $hots -U $user -d $db_name)
		#-----------------------------------------------------------------------------
	else
		flag3=1
	fi

	if [ -n "$arrgnc" ] && [ $flag3 = 1 ] && [ $flag2 = 0 ]
		then
		flag2=1
	    
	    for vid in ${arrgnc[@]}
		do
			#-------- Insert in the facturas_gastos_comunes table -------------------------------
			query="INSERT INTO facturas_gastos_comunes(cod_gasto_comun_fk, cod_factura_fk)
				    VALUES ($vid, $fid);"
			q=$(echo $query | psql -h $hots -U $user -d $db_name)
			#-----------------------------------------------------------------------------
		done
	fi

done < $path"copiacondc3.txt"