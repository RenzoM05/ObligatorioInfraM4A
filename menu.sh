#!bin/bash

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
			sh mostrar_o.sh
		;;
		3)
			sh generar_reporte.sh
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
