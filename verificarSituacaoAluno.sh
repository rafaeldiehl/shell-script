#!/bin/bash
#  Primeiramente, dê permissão de execução para o arquivo:
#  > sudo chmod +x verificarSituacaoAluno.sh
#  Em seguida, execute-o:
#  > ./verificarSituacaoAluno.sh

#  Expressão regular para números reais positivos.
regex='^[0-9]+\.?[0-9]*$'

#  Estruturas if que verificam se a nota recebida é um número positivo entre 0 e 10.
#  Caso não seja, o programa encerra.
#  Obs: O operador =~ é usado  para testar uma variável em relação a uma expressão regular.
validacao() {
  if ! [[ $1 =~ $regex ]] ; then
    echo "erro: A nota deve ser um número positivo" ; exit 1
  fi

  if (( $(echo "$1 > 10" | bc -l) || $(echo "$1 < 0" | bc -l) )) ; then
    echo "erro: A nota deve estar numa escala 0-10" ; exit 1
  fi
}

#  Leitura da primeira nota.
echo -n "Informe a primeira nota e pressione [ENTER]: "
read nota1;

#  Validação da primeira nota.
validacao $nota1;

#  Leitura da segunda nota.
echo -n "Informe a segunda nota e pressione [ENTER]: "
read nota2;

#  Validação da segunda nota.
validacao $nota2;

#  Cálculo da média das duas notas.
media=$(echo "scale=2;($nota1+$nota2)/2" | bc)

#  Estrutura if que verifica se o(a) aluno(a) está aprovado(a), reprovado(a) ou em recuperação.
if (( $(echo "$media >= 6" | bc -l) )) ; then
  condicao="Aprovado"
elif (( $(echo "$media >= 5" | bc -l) )) ; then
  condicao="Recuperação"
else
  condicao="Reprovado"
fi

#  Saída do programa, exibindo a média do(a) aluno(a) e sua condição.
echo -e "\nA média do(a) aluno(a) é: ${media}"
echo "Situação: ${condicao}"