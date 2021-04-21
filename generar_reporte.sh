#!bin/bash

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

