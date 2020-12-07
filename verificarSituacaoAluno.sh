#!/bin/bash
#  Primeiramente, dê permissão de execução para o arquivo:
#  > sudo chmod +x verificarSituacaoAluno.sh
#  Em seguida, execute-o:
#  > ./verificarSituacaoAluno.sh

#  Expressão regular para números reais positivos.
regex='^[0-9]+\.?[0-9]*$'

#  Leitura da primeira nota.
echo -n "Informe a primeira nota e pressione [ENTER]: "
read nota1;

#  Estrutura if que verifica se a primeira variável recebida é um número positivo.
#  Se não for, o programa encerra.
if ! [[ $nota1 =~ $regex ]] ; then
  echo "erro: A nota deve ser um número positivo" ; exit 1
fi

#  Estrutura if que verifica se a primeira variável está na escala 0-10.
#  Se não for, o programa encerra.
if (( $(echo "$nota1 > 10" | bc -l) || $(echo "$nota1 < 0" | bc -l) )) ; then
  echo "erro: A nota deve estar numa escala 0-10" ; exit 1
fi

#  Leitura da segunda nota.
echo -n "Informe a segunda nota e pressione [ENTER]: "
read nota2;

#  Estrutura if que verifica se a segunda variável recebida é um número positivo.
#  Se não for, o programa encerra.
if ! [[ $nota2 =~ $regex ]] ; then
  echo "erro: A nota deve ser um número positivo" ; exit 1
fi

#  Estrutura if que verifica se a segunda variável está na escala 0-10.
#  Se não for, o programa encerra.
if (( $(echo "$nota2 > 10" | bc -l) || $(echo "$nota2 < 0" | bc -l) )) ; then
  echo "erro: A nota deve estar numa escala 0-10" ; exit 1
fi

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