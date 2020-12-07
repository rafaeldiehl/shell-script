#!/bin/bash
#  Recebe dois números inteiros e realiza as quatro operações matemáticas básicas.
#  Primeiramente, dê permissão de execução para o arquivo:
#  > sudo chmod +x calculo.sh
#  Em seguida, execute-o:
#  > ./calculo.sh

#  Expressão regular para números inteiros.
regex='^[0-9]+$'

#  Estrutura if que verifica se a variável recebida é um inteiro.
#  Se não for, o programa encerra.
#  Obs: O operador =~ é usado  para testar uma variável em relação a uma expressão regular.
validacao() {
  if ! [[ $1 =~ $regex ]] ; then
    echo "erro: \"${1}\" não é um número inteiro" ; exit 1
  fi
}

#  Leitura da primeira variável.
echo -n "Informe o primeiro número inteiro e pressione [ENTER]: "
read int1

#  Validação da primeira varíavel.
validacao $int1

#  Leitura da segunda variável.
echo -n "Informe o segundo número inteiro e pressione [ENTER]: "
read int2

#  Validação da segunda varíavel.
validacao $int2

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