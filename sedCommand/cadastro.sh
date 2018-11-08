#/bin/bash
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
Versao 2.0
*"
echo "*
*"
echo "*
*"
echo "******************************************************"
echo

echo
echo $nome $sobrenome $cpf > arquivo.tmp
echo $nome $sobrenome $cpf >> arquivo.cad
sleep 2
echo " Cadastro realizado com sucesso "
echo
echo "Pressione <enter> para Continuar"
read pause


clear
echo "Nome Sobrenome CPF"
echo
cat arquivo.tmp
echo
echo "************************************************"
echo "*
Usuario Cadastrado com sucesso
*"
echo "************************************************"
echo
echo "Nome Sobrenome CPF"
echo
cat arquivo.cad
echo 
#Deletar
echo "Qual usuario voce deseja deletar?"
cat arquivo.cad
echo "Digite a linha que deseja apagar: "
read apaga
echo
sed -i $apaga'd' arquivo.cad
echo
echo "Cadastro apagado com sucesso"
echo
echo "Nome Sobrenome"
echo
cat arquivo.cad
echo "Pressione <enter> para Continuar"
read pause
sleep 2
#exit
#atualizar
echo "Qual usuario voce deseja atualizar?"
echo
read antigo
echo
echo "Digite novo nome"
echo
read novo
echo
sed -i 's/'$antigo'/'$novo'/g' arquivo.cad
echo
echo "Cadastro sobrescrito com sucesso"
echo
echo "Pressione <enter> para Continuar"
read pause
echo "Nome Sobrenome"
echo
cat arquivo.cad
sleep 2

#exit
#buscar

echo "Qual o nome do usuario voce deseja buscar?"
read usuario
sed -n "/$usuario/p" arquivo.cad > arquivo.tmp
echo
cat arquivo.tmp
echo
echo "Pressione <enter> para Continuar"
read espera


cadastro(){

echo "Nome - Sobrenome"
cat arquivo.cad
echo
echo "pressione <ENTER>"
read espera
echo "entre Nome"
read nome
echo "..... Aguarde"
sleep 1
echo
echo "entre o sobrenome"
read sobrenome
echo "..... Aguarde"
sleep 1

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


verifica2(){
cont=1
while [ $cont == 1 ]
do
echo "Digite o seu CPF: "
read cpf
#while [ "${#cpf}" != "11" ];
#do
#echo "CPF invalido, tente novamente!"
#read cpf
#done

if ( echo $cpf | egrep '[^0-9]' && "${#cpf}" != "11"  &> /dev/null ); then
echo "Erro CPF com caracteres invalidos"
cont=1
else
cont=2
fi
done

}
exit
