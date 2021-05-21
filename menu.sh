#!bin/bash

function Fortaleza
{
	echo "Ingresaste la contraseña"
	read password
	password=${password,,}
	echo ""
	echo "----------------------------------------------"

	largo=$(expr "${#password}")
	isPasswordSecure=1
	re="[0-9]"
	minimunLenght=3
	noNumberPassword=$(printf '%s' "$password" | sed 's/[0-9]//g')

	if [[ -z "$noNumberPassword" ]];
	then
		echo "La contraseña debe tener caracteres no numericos"
		isPasswordSecure=0
	else
		PalabraExisteEnDiccionario
		retorno=$?	
	fi

	if (($largo < $minimunLenght));
	then
		echo "La contraseña es demasiado corta"
		isPasswordSecure=0
	fi

	if [[ ! $password =~ $re ]];
	then
		echo "Debe contener numeros"
		isPasswordSecure=0
	fi

	if (( $retorno == 1 ));
	then
		echo "La palabra se encuentra en el diccionario"
		isPasswordSecure=0
	fi

	if (( $isPasswordSecure == 1))
	then
		echo "La contraseña es segura"
	fi
	echo "----------------------------------------------"
}

function PalabraExisteEnDiccionario
{
	resultadoDeBusqueda=$(grep -x $noNumberPassword diccionario.txt) &>/dev/null 
	if [[ -z $resultadoDeBusqueda ]];
	then
		retorno=0
	else
		retorno=1
	fi
	return "$retorno"
}

function ObtenerO
{
	MSG="Lista de palabras del diccionario que estan compuestas por la vocal 'o' unicamente:"
	echo ""
	echo $MSG
	echo ""
	grep -Ei "o+" diccionario.txt | grep -vE "[aeiu]+"
	echo ""	
}

function GenerarReporte
{
	mkdir informes &>/dev/null 

	day=$(date +%d)
	month=$(date +%m)
	year=$(date +%y)
	hour=$(date +%H)
	minute=$(date +%M)

	echo "Fecha del registro $day/$month/$year $hour:$minute" > informes/letras_o.txt 2>>err.log
	echo "" >> informes/letras_o.txt 2>>err.log
	grep -Ei "o+" diccionario.txt | grep -vE "[aeiu]+" >> informes/letras_o.txt 2>>err.log

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

	day=$(date +%d)
	month=$(date +%m)
	year=$(date +%y)
	hour=$(date +%H)
	minute=$(date +%M)

	case $option in
		1)
		        echo "$day/$month/$year $hour:$minute: Usuario Selecciono: Opcion 1 - Fortaleza" >> log_script.txt
			Fortaleza
		;;
		2)
			echo "$day/$month/$year $hour:$minute: Usuario Selecciono: Opcion 2 - Obtener \"o\"" >> log_script.txt
			ObtenerO
		;;
		3)
			echo "$day/$month/$year $hour:$minute: Usuario Selecciono: Opcion 3 - Guardar Informe" >> log_script.txt
			GenerarReporte
		;;
		4)
			echo "$day/$month/$year $hour:$minute: Usuario Selecciono: Opcion 4 - Salir" >> log_script.txt
			echo "Saliendo"
		;;
		*)
			echo "Opción no valida"
		;;
	esac
	read -p 'Presione cualquier boton para continuar... '
done


