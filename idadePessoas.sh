#!/bin/bash
#  Recebe a idade e sexo de determinado grupo de pessoas, calcula e mostra:
#  a) A idade média do grupo;
#  b) A idade média das mulheres;
#  c) A idade média dos homens.
#  Primeiramente, dê permissão de execução para o arquivo:
#  > sudo chmod +x idadePessoas.sh
#  Em seguida, execute-o:
#  > ./idadePessoas.sh

#  Número de pessoas que serão informadas
quantPessoas=6

#  Quantidade de homens e mulheres
quantMasc=0
quantFem=0

#  Somatório das idades
idadeTotal=0
idadeMasc=0
idadeFem=0

#  Iterador que se inicia como zero
i=0

#  Expressões regulares para os dados
regexIdade='^[0-9]+$'
regexSexo='^(M|F)$'

#  Validação dos dados
validIdade=false
validSexo=false

#  Lorem ipsum dolor sit amet
until [[ $i -eq $quantPessoas ]]
do

  #  Exibe o número da pessoa atual
  echo "PESSOA Nº $((i+1))"

  #  Recebe a idade da pessoa
  #  Se o valor for inválido, ocorrerá um loop até que ele se torne válido
  while [[ $validIdade == false ]]
  do
    echo -n "Informe sua idade: "
    read idade
    if ! [[ $idade =~ $regexIdade ]]; then
      echo "erro: \"${idade}\" não é uma idade válida. Por favor, informe um valor válido."
    else
      validIdade=true
    fi
  done

  #  Recebe o sexo da pessoa
  #  Se o valor for inválido, ocorrerá um loop até que ele se torne válido
  while [[ $validSexo == false ]]
  do
    echo -n "Informe seu sexo (M|F): "
    read sexo
    if ! [[ $sexo =~ $regexSexo ]]; then
      echo "erro: \"${sexo}\" não é um sexo válido. Por favor, informe um valor válido (M|F)."
    else
      validSexo=true
    fi
  done

  #  Soma a idade da pessoa a idade total do grupo
  idadeTotal=$((idadeTotal+idade))

  #  Se a pessoa for um homem, a quantidade e idade total de homens aumentará
  #  Senão, a pessoa será uma mulher e a quantidade e idade total de mulheres aumentará
  if [[ $sexo == "M" ]]; then
    quantMasc=$((quantMasc+1))
    idadeMasc=$((idadeMasc+idade))
  else
    quantFem=$((quantFem+1))
    idadeFem=$((idadeFem+idade))
  fi

  #  Pula uma linha e incrementa o iterador
  echo ""
  i=$((i+1))

  #  As validações são resetadas para o próximo laço
  validIdade=false
  validSexo=false

done

#  Cálculo das médias das idades
#  Diferente da idade isolada, a média pode ser um valor real
#  O comando `sed`, nesse caso, serviu para tirar os zeros a esquerda
idadeMedTotal=$(echo "scale=2;$idadeTotal/$quantPessoas" | bc | sed '/\./ s/\.\{0,1\}0\{1,\}$//')
idadeMedMasc=$(echo "scale=2;$idadeMasc/$quantMasc" | bc | sed '/\./ s/\.\{0,1\}0\{1,\}$//')
idadeMedFem=$(echo "scale=2;$idadeFem/$quantFem" | bc | sed '/\./ s/\.\{0,1\}0\{1,\}$//')

#  Saída do programa, exibindo as médias das idades
echo "a) Idade média do grupo: $idadeMedTotal"
echo "b) Idade média das mulheres: $idadeMedFem"
echo "c) Idade média dos homens: $idadeMedMasc"