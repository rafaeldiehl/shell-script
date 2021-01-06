#!/bin/bash
#  Recebe o caminho de um diretório e indica se cada um dos objetos contidos nele é um arquivo, diretório ou nenhum dos dois
#  Primeiramente, dê permissão de execução para o arquivo:
#  > sudo chmod +x verificarDiretoriosArquivos.sh
#  Em seguida, execute-o:
#  > ./verificarDiretoriosArquivos <caminho>

#  Expressão regular para o caminho
regex='^[/]'

#  Verifica se o número de parâmetros é válido.
#  Se não for, o programa encerra.
if [ $# -ne 1 ] ; then
  echo "erro: Número de parâmetros inválido."
  echo "sintaxe: $0 /caminho" ; exit 1
fi

#  Verifica se o caminho informado é válido.
#  Se não for, o programa encerra.
if ! [[ $1 =~ $regex ]] ; then
  echo "erro: O caminho informado é inválido."
  echo "sintaxe: $0 /caminho"; exit 1
fi

#  Laço de repetição que verifica se o item é um diretório, arquivo ou nenhum dos dois. Após a verificação, a exibe como saída para o usuário.
for i in $(ls $1)
do
  echo -n "O item $i é "
  if [[ -d $1/$i ]]; then
    echo "um diretório"
  elif [[ -f $1/$i ]]; then
    echo "um arquivo"
  else
    echo "diferente de um diretório ou arquivo"
  fi
done; exit 0