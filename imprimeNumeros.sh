#!/bin/bash
#  Exibe números de um determinado intervalo
#  A cada passada o usuário deve informar um número localizado nesse intervalo
#  O script termina no número anterior ao último número informado pelo usuário
#  O script é interrompido ao digitar '-1'
#  Primeiramente, dê permissão de execução para o arquivo:
#  > sudo chmod +x imprimeNumeros.sh
#  Em seguida, execute-o:
#  > ./imprimeNumeros.sh

#  Definindo o intervalo de números
min=30
max=60

#  Loop until para o intervalo estabelecido
until [[ $min-1 -eq $max ]]
do

  #  Pula os números 33, 35 e 55
  if ! [ $min -eq 33 -o $min -eq 35 -o $min -eq 55 ]; then
    echo $min
    if [[ $min -eq newMax-1 ]]; then
      break
    fi
    echo -n "- Digite um número entre 30 e 60: "
    read newMax
  fi

  #  Incremento na varíavel de controle
  min=$((min+1))

  # Encerra o programa se o usuário digitar '-1'
  if [[ newMax -eq -1 ]]; then
    break 
  fi

done