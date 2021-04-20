clear

echo "Lista de palabras del diccionario que estan compuestas por la vocal 'o' unicamente:"

grep -Ei "o+" diccionario.txt | grep -vE "[aeiu]+"

echo ""

