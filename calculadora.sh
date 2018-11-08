#!/bin/bash
#Matheus - 16.00177-0
menu ()
{

clear

echo "Escolha uma das opções a seguir:  "
echo "< 1 > Somar "
echo "< 2 > Subtração "
echo "< 3 > Multiplicação "
echo "< 4 > Divisão "
echo "< 0 > Sair "
echo
read  opcao

case $opcao in
    1) soma ;;
    2) subtracao ;;
    3) multiplicacao ;;
    4) divisao ;;
    0) exit ;;
esac

}

soma ()
{

	echo "Quantos numeros deseja somar:"
	read num
	num=$(( num+1 ))
	i=1
	soma=0
	while [ $i != $num ]
	do
		echo "Digite o número: "
    	read num1
    	soma=$( echo "scale=2 ;$soma+$num1" | bc )
		i=$(( i+1))
	done	

    #mostra para o usuario
	echo "scale=2 ;$soma" | bc

echo
echo "--------------------------------"
echo

    echo "< m >  Menu Principal"
    echo "< s >  Sair"

    echo "Escolha uma opção:"
    read op

    if [ "$op" = "m" ]
    then
        menu
    elif [ "$op" = "s" ]
    then
        clear
        exit
    else
        echo " Opção Inválida! "
    fi

}

subtracao ()
{
	#funcao para subtrair quantos numeros desejar
	echo "Quantos numeros de seja subtrair"
	read num
	num=$(( num+1 ))
	i=1
	resp=0
	echo "Digite um numero: "
    read num1
	resp=$num1
	i=$(( i+1))
	while [ $i != $num ]
	do
		echo "Digite o numero"
		read num1
		resp=$( echo "scale=2 ;$resp-$num1" | bc)
		i=$(( i+1))
done
	
	#mostra para o usuario
	echo "scale=2 ;$resp" | bc		


echo
echo "--------------------------------"
echo

    echo "< m >  Menu"
    echo "< s >  Sair"

    echo "Escolha uma opção: "
    read op

    if [ "$op" = "m" ]
    then
        menu
    elif [ "$op" = "s" ]
    then
        clear
        exit
    else
        echo " Opção Inválida! "
    fi

}

multiplicacao ()
{

	echo "Quantos numeros de seja multiplicar"
	read num
	i=1
	mult=1
	while [ $i -le $num ]
	do
	echo "Digite o número: "
    read num1
	mult=$( echo "scale=2 ;$mult*$num1" | bc )
	((i=$i+1))
	done	

	#mostra para o usuario
	echo "scale=2 ;$mult" | bc

echo
echo "--------------------------------"
echo

    echo "< m >  Menu Principal"
    echo "< s >  Sair"

    echo "Escolha uma opção:"
    read op

    if [ "$op" = "m" ]
    then
        menu
    elif [ "$op" = "s" ]
    then
        clear
        exit
    else
        echo " Opção Inválida! "
    fi

}

divisao ()
{

	echo "Quantos numeros de seja dividir"
	read num
	num=$(( num+1 ))
	i=1
	echo "Digite um numero: "
    read num1
	resp=$num1
	i=$(( i+1 ))
	while [ $i != $num ]
	do
		echo "Digite o numero"
		read num1
		resp=$( echo "scale=2 ;$resp/$num1" | bc)
		i=$(( i+1))
done

	#mostra para o usuario
	echo "scale=2 ;$resp" | bc


    

echo
echo "--------------------------------"
echo

echo "< m >  Menu Principal"
    echo "< s >  Sair"

    echo "Escolha uma opção:"
    read op

    if [ "$op" = "m" ]
    then
        menu
    elif [ "$op" = "s" ]
    then
        clear
        exit
    else
        echo " Opção Inválida! "
    fi

}

menu

