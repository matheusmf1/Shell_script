#!/bin/bash
#Calculo das raízes de equação de segundo grau

echo
echo "Valor de a: "
read a
echo "Valor de b: "
read b
echo "Valor de c: "
read c

# verifica se todos os parâmetros estão preenchidos
if [ -z $a ] || [ -z $b ] || [ -z $c ]; then
    echo "--------------------------------------========"
    echo " ERRO: Faltando parâmetros"
    echo "--------------------------------------========"
    echo
    exit

# verificar se a = 0
elif [ $a -eq 0 ]; then
    echo
    echo "--------------------------------------========"
    echo " ERRO: Impossível calcular"
    echo "--------------------------------------========"
    echo
    exit
fi

delta=`bc << EOF
    scale=3
    a=($b * $b) # b^2
    b=(4 * $a * $c) # 4ac
    a - b #b^2 - 4ac
EOF
`
echo
echo "Delta = $delta"
# verificar se delta < 0
if [ $delta -lt 0 ]; then
    echo
    echo "---------------------------------"
    echo " Não possui raízes reais"
    echo "---------------------------------"
    echo
    exit
fi

x1=`bc << EOF
    scale=3
    n=(((-1)*$b)+sqrt($delta)) # -b+raiz(delta)/2a
    n/(2*$a)
EOF
`
# se delta = 0,  então só há uma raiz real
if [ $delta -eq 0 ]; then
    echo
    echo "-----------------------------------"
    echo " x = $x1"
    echo "-----------------------------------"
    echo
    exit
fi

x2=`bc << EOF
    scale=3
    n=(((-1)*$b)-sqrt($delta)) # -b+raiz(delta)
    n/(2*$a) #  dividir por 2a
EOF
`
echo
echo "-----------------------------------"
echo " x1 = $x1"
echo " x2 = $x2"
echo "-----------------------------------"
echo
exit
