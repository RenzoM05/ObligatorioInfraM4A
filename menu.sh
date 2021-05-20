#!bin/bash

function ObtenerO
{
	MSG = "Lista de palabras del diccionario que estan compuestas por la vocal 'o' unicamente:"
	echo ""
	echo $MSG
	echo ""
	grep -Ei "o+" diccionario.txt | grep -vE "[aeiu]+"
	echo ""	
}

function GenerarReporte
{
	mkdir Informes 2>>err.log

	day=$(date +%d)
	month=$(date +%m)
	year=$(date +%y)
	hour=$(date +%H)
	minute=$(date +%M)

	echo "Fecha del registro $day/$month/$year $hour:$minute" > Informes/letras_o.txt 2>>err.log
	echo "" >> Informes/letras_o.txt 2>>err.log
	grep -Ei "o+" diccionario.txt | grep -vE "[aeiu]+" >> Informes/letras_o.txt 2>>err.log

	echo "Se Genero el Reporte $day/$month/$year $hour:$minute"
}

option=0

while [ $option != 4 ]
do
	clear
	echo "1) Opción 1. Probar Fortaleza."
	echo "2) Opción 2. Obtener \"o\"."
	echo "3) Opción 3. Guardar Informe."
	echo "4) Opción 4. Salir."
	echo "-------------------------------"
	echo "Ingrese una opción: "
	tput cup 5 21
	read option

	case $option in
		1)
			sh fortaleza.sh
		;;
		2)
			ObtenerO
		;;
		3)
			GenerarReporte
		;;
		4)
			echo "Saliendo"
		;;
		*)
			echo "Opción no valida"
		;;
	esac
	read -p 'Presione cualquier boton para continuar... '

done


