#!/bin/bash
echo "Digite um número qualquer:" 
read numero;
if [ "$numero" -ge 0 ];
then
echo "O número $numero é positivo!"
else
echo "O número $numero é negativo!"
fi
