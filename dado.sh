#!/bin/bash
#Matheus RA: 16.00177-0

echo "---- Bem vindo ao jogo -----"

menu() {
echo
echo "Escolha uma das seguintes opções:"
echo
echo "<1> Para iniciar o jogo"
echo "<2> Sair"
read op

case $op in
    1) dado ;;
    2) sair ;;
esac

}


dado() {
echo
echo "Entre com nome do jogador 1: "
read p1

if [ z $p1 ];
	then
	echo "Nome vazio, digite novamente"
	read p1;
fi

echo "Entre com nome do jogador 2: "
read p2
if [ z $p2 ]
	then
	echo "Nome vazio, digite novamente"
	read p2;
fi

	

num1=$(($RANDOM % 7))
echo "Numero do jogador 1 $p1: $num1"

num2=$(($RANDOM % 7))
echo "Numero do jogador2 $p2: $num2"

if [ $num1 -gt $num2 ];
	then
	echo
	echo "Jogador 1 $p1 ganhou"
else
echo
echo "Jogador 2 $p2 ganhou"
fi

echo
echo "--------------------------------"
echo
menu
}


sair() {
echo "		-------------------------------"
echo "		-------------------------------"
echo
echo "         	   Obrigado por ter jogado"
echo
echo "		-------------------------------"
echo "		-------------------------------"
exit

}

menu
