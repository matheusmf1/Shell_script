#!/bin/bash
echo "Testando o comando seq" 
for i in $(seq 1 100);
do
	echo "$i" 
done

#!/bin/bash
echo "Testando o comando seq" 
for i in $(seq 0 5 100);
do
	echo "$i" 
done
