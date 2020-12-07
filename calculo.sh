#!/bin/bash
#  Primeiramente, dê permissão de execução para o arquivo:
#  > sudo chmod +x calculo.sh
#  Em seguida, execute-o:
#  > ./calculo.sh

#  Expressão regular para números inteiros.
regex='^[0-9]+$'

#  Leitura da primeira variável.
echo -n "Informe o primeiro número inteiro e pressione [ENTER]: "
read int1

#  Estrutura if que verifica se a primeira variável recebida é um inteiro.
#  Se não for, o programa encerra.
#  Obs: O operador =~ é usado  para testar uma variável em relação a uma expressão regular.
if ! [[ $int1 =~ $regex ]] ; then
  echo "erro: \"${int1}\" não é um número inteiro" ; exit 1
fi

#  Leitura da segunda variável.
echo -n "Informe o segundo número inteiro e pressione [ENTER]: "
read int2

#  Estrutura if que verifica se a segunda variável recebida é um inteiro.
#  Se não for, o programa encerra.
if ! [[ $int2 =~ $regex ]] ; then
  echo "erro: \"${int2}\" não é um número inteiro" ; exit 1
fi

#  Declaração das variáveis que realizam as operações.
let soma=int1+int2
let subtracao=int1-int2
let multiplicacao=int1*int2
let divisao=int1/int2

#  Saída do programa, exibindo os valores das variáveis e as quatro operações básicas.
echo -e "\nOs valores informados são ${int1} e ${int2}"
echo "Soma (${int1} + ${int2}) = ${soma}"
echo "Subtração (${int1} - ${int2}) = ${subtracao}"
echo "Multiplicação (${int1} + ${int2}) = ${multiplicacao}"
echo "Divisão (${int1} / ${int2}) = ${divisao}"