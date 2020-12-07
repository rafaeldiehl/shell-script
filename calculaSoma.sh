#!/bin/bash
#  Recebe três valores A, B e C, e informa se a soma de A com B é menor, maior ou igual a C.
#  Primeiramente, dê permissão de execução para o arquivo:
#  > sudo chmod +x calcularSoma.sh
#  Em seguida, execute-o:
#  > ./calcularSoma.sh <numero1> <numero2> <numero3>

#  Expressão regular para números reais.
regex='^[-+]?[0-9]+\.?[0-9]*$'

#  Verifica se o valor informado é um número.
#  Se não for, o programa encerra.
validacaoValor() {
  if ! [[ $1 =~ $regex ]] ; then
    echo "erro: Os valores informados devem ser números" ; exit 1
  fi
}

#  Verifica se o número de parâmetros é válido.
#  Se não for, o programa encerra e a sintaxe correta é informada ao usuário.
if [ $# -ne 3 ] ; then
  echo "erro: Número de parâmetros inválido."
  echo "sintaxe: $0 <numero1> <numero2> <numero3>" ; exit 1
fi

#  Validação dos valores A, B e C.
validacaoValor $1
validacaoValor $2
validacaoValor $3

# Estrutura if que verifica se a soma de A com B é menor, maior ou igual a C e atribui a condição à uma variável.
if (( $(echo "$1 + $2 > $3" | bc -l) )) ; then
  condicao="Maior"
elif (( $(echo "$1 + $2 < $3" | bc -l) )) ; then
  condicao="Menor"
else
  condicao="Igual"
fi

#  Saída do programa, exibindo os valores A, B e C, e informando se a soma de A com B é menor, maior ou igual a C.
echo "Os valores informados foram: "
echo "A = " $1
echo "B = " $2
echo "C = " $3
echo "A soma de A com B é menor, maior ou igual C? ${condicao}"