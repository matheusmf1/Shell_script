#!/bin/bash

main(){

c1=1
while [ $c1 == 1 ]
	do
		echo "Entre com o CPF"
		read cpf
		
		cpf=${cpf/000.000.000-00/-$cpf}
		
		if ! echo $cpf | egrep -q '^([0-9]{3}[.]){2}([0-9]{3}[-])[0-9]{2}$'; then
			echo "$FUNCNAME: '$cpf' CPF inválido."
			echo "Digite novamente xxx.xxx.xxx-xx"

		else
			validacpf $cpf			
			c1=2			
		fi	
	done
exit
}

validacpf(){
	cpf=$1
	NUM=($(echo $cpf | sed -r 's/[.-]+//g;s/./& /g'))
	#MOSTRA O ARRAY
	#echo ${NUM[@]}
	
	#VERIFICA OS 9 digitos	
	VAL=$(((${NUM[0]}*10)+(${NUM[1]}*9)+(${NUM[2]}*8)+(${NUM[3]}*7)+(${NUM[4]}*6)+(${NUM[5]}*5)+(${NUM[6]}*4)+(${NUM[7]}*3)+(${NUM[8]}*2)))
		
	#echo "VAL"
	#echo $VAL
	#VERIFICA O 1 DIGITO
	[ $(($VAL%11)) -lt 2 ] && DV[1]=0 || DV[1]=$((11-($VAL%11)))
			
	VAL=$(((${NUM[0]}*11)+(${NUM[1]}*10)+(${NUM[2]}*9)+(${NUM[3]}*8)+(${NUM[4]}*7)+(${NUM[5]}*6)+(${NUM[6]}*5)+(${NUM[7]}*4)+(${NUM[8]}*3)+(${DV[1]}*2)))
			
	#echo "VAL2"
	#echo $VAL	
	#VERIFICA O 2 DIGITO
	[ $(($VAL%11)) -lt 2 ] && DV[2]=0 || DV[2]=$((11-($VAL%11)))
	
	if [ ${DV[1]} -eq ${NUM[9]} -a ${DV[2]} -eq ${NUM[10]} ]; then
		echo "CPF válido"
	else
		echo "CPF inválido"
	fi		
}
main


