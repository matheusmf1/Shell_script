#/bin/bash
#Autor: Matheus
#08-11-2018

clear
echo "******************************************************"
echo "*
*"
echo "*
*"
echo "*
		Sistema de cadastramento
*"
echo "*
			Versão 3.0.1
*"
echo "*
*"
echo "*
*"
echo "******************************************************"
sleep 1
clear
main(){

menu

}


menu(){
echo
echo "Escolha uma opção abaixo:"
echo "1 - Cadastrar usuario"
echo "2 - Deletar usuario"
echo "3 - Buscar por usuario"
echo "4 - Visualizar todos os cadastros"
echo "5 - Atualizar cadastro"
echo "6 - Para sair"

read op;
case $op in
"1")
cadastro ;;

"2")
deletar ;;
"3")
buscar ;;
"4")
getAll ;;
"5")
atualizar ;;
"6")
exit ;;
esac

}

cadastro(){
clear
echo "Quantos usuarios deseja cadastrar?"
read num
i=1
while [ $i -le $num ];
	do
		echo "Entre com o nome"
		read nome;
		while [ -z $nome ];
			do
				echo "Entre com o nome"
				read nome;
			done

		echo "Entre com o sobrenome"
		read sobrenome;
		while [ -z $sobrenome ];
			do
				echo "Entre com o sobrenome"
				read sobrenome;
		done
		
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
				result=$(validacpf $cpf)
				#echo $result
				
				if [ "$result" -eq 1 ]; then	
					echo
					echo "CPF válido"						
					c1=2
				else
					echo
					echo "CPF inválido"
					c1=1
				fi			
			fi	
		done
	
	echo $nome $sobrenome $cpf >> arquivo.cad
	((i=$i+1))

echo
echo "***************************************"
echo "*
	Usuario Cadastrado com sucesso
*"
echo "***************************************"
menu

done

}

deletar(){
clear
echo "Lista de usuarios cadastrados"
echo
cat arquivo.cad
echo
echo "Qual CPF voce deseja deletar?"
read apaga
sed -i '/'$apaga'/ d' arquivo.cad 

echo
echo "Cadastro apagado com sucesso"
echo
echo "Nome Sobrenome CPF"
echo
cat arquivo.cad
echo
echo "************************************************"
echo "*
Usuario excluido com sucesso
*"
echo "************************************************"

echo "Pressione <enter> para Continuar"
read pause
clear
menu
}


atualizar(){
clear
cat arquivo.cad
echo
echo "Qual o nome do usuario voce deseja atualizar?"
echo
read antigo
echo
echo "Sobrenome Antigo"
echo
read antigo2
echo
echo "Digite novo nome"
echo
read novo
echo
echo "Digite novo sobrenome"
echo
read novo2
sed -i 's/'$antigo'/'$novo'/g' arquivo.cad
sed -i 's/'$antigo2'/'$novo2'/g' arquivo.6cad

echo
echo "Cadastro sobrescrito com sucesso"
echo
echo "Pressione <enter> para Continuar"
read pause
echo "Nome Sobrenome"
echo
cat arquivo.cad
echo
echo "************************************************"
echo "*
Usuario atualizado com sucesso
*"
echo "************************************************"

echo "Pressione <enter> para Continuar"
read pause
clear
menu
}

getAll(){
clear
echo "Nome Sobrenome CPF"
echo
cat arquivo.cad
menu
}

buscar(){
clear
echo "Qual o nome do usuario voce deseja buscar?"
read usuario
sed -n "/$usuario/p" arquivo.cad > arquivo.tmp
echo
cat arquivo.tmp
echo
echo "Pressione <enter> para Continuar"
read espera
clear
menu
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
		res=1
		echo $res
		
	else
		res=0
		echo $res
		
	fi		
}

main
