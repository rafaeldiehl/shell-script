#!/bin/bash
#  Exibe determinada quantidade de números ímpares naturais
#  Primeiramente, dê permissão de execução para o arquivo:
#  > sudo chmod +x numerosImpares.sh
#  Em seguida, execute-o:
#  > ./numerosImpares

#  Iterador que se inicia como zero, por se tratar de números naturais
i=0;

#  Quantidade de números ímpares naturais que será exibida
quant=10;

#  Loop until que para quando o iterador é igual ao dobro da quantidade de números ímpares,
#  pois ele também assumirá valores pares no meio do processo
until [ $i -eq $(( $quant * 2 )) ]
do

  #  Verifica se o número é ímpar, ou seja, com resto diferente de 0
  #  Se for, ele será exibido na saída
  if ! [[ $(( $i % 2 )) -eq 0 ]] ; then

    #  Mecanismo para exibição dos números dispostos em vírgulas
    #  O último número não apresenta uma vírgula posterior a ele
    if [[ $i -eq $(( $quant * 2 - 1)) ]] ; then 
      echo "${i}"
    else
      echo -n "${i}, "
    fi

  fi

  #  Incremento no valor do iterador
  i=$((i+1))
  
done