#!/bin/bash

main()
{
echo "Escolha uma opção abaixo:"
echo "1 - Esvaziar a lixeira"
echo "2 - Calcular fatorial"
echo "3 - cpf"
read op;
case $op in
"1")
esvaziar_lixeira
;;

"2")
calcular_fatorial
;;
"3")
verificaCpf
esac
}


verificaCpf(){
cont=1
while [ $cont == 1 ]
do
echo "Digite o seu CPF: "
read cpf
while [ "${#cpf}" != "11" ];
do
echo "CPF invalido, tente novamente!"
read cpf
done

if ( echo $cpf | egrep '[^0-9]' &> /dev/null ); then
echo "Erro CPF com caracteres invalidos"
echo "Exemplo xxxxxxxxxx somente numeros"
cont=1
else
cont=2
fi
done
}

calcular_fatorial()
{
echo "Informe um número:"
read numero;
i=1
fat=1
while [ $i -le $numero ] 
do
fat=$(($fat*$i)) 
i=$(($i+1))
done
echo "fatorial de $numero é $fat" 
}
main


