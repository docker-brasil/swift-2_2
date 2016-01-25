#!/bin/bash
set -e

#
# No ENTRYPOINT executo a opção escolhida pelo usuário que pode ser:
# '--help'
# '/bin/bash' (para investigação e debug do contêiner)
# 'swift' (workflow normal de desenvolvimento)
# 'daemon' (rodando uma aplicação desenvolvida em Swift como Daemon)
#
# e-mail do user admin
if [ -z "$EMAIL_ADDR" ]; then
    EMAIL_ADDR='joao.parana@icloud.com'
fi
echo "••• `date` - EMAIL_ADDR : $EMAIL_ADDR "

if [ -z "$1" ]; then
  CMD_OPTION='/bin/bash'
else
  CMD_OPTION="$1"
fi

if [ $CMD_OPTION = '--help' ]; then
    echo " "
    echo " "
    echo "Você pode invocar este Contêiner em 6 modos diferentes:"
    echo " "
    echo "docker run --rm -i-t NOME-IMAGEM --help"
    echo "       Para ver esta mensagem"
    echo "docker run --rm -i-t NOME-IMAGEM --version"
    echo "       Para ver versão do Swift"
    echo "docker run --rm -i-t NOME-IMAGEM swift [parâmetros]"
    echo "       Para iniciar o Swift com os parâmetros opcionais informados"
    echo "docker run --rm -i-t NOME-IMAGEM daemon [parâmetros]"
    echo "       Para iniciar o Swift com os parâmetros opcionais informados porém como Daemon"
    echo "docker run --rm -i-t NOME-IMAGEM /bin/bash"
    echo "       Para iniciar apenas uma shell bash - isto serve para investigar problemas"
    echo " "
    echo "Observação:"
    echo "  Você poderá substituir as opções '--rm -i-t' pela opção '-d' "
    echo "  Isso fará com que o conteiner rode como Daemon. "
    echo "  Mas isso só faz sentido para o caso da opção  "
    echo "  • daemon"
    echo " "
    exit 0
fi

echo ". . . . Contêiner swift-2_2 . . . ."
echo "Você invocou com os seguintes parâmetros: $@"
if [ $CMD_OPTION = '--version' ]; then
    echo "Veja abaixo os detalhes da versão do Swift instalado"
    swift --version
    exit 0
fi

if [ $CMD_OPTION = '/bin/bash' ]; then
    echo "••• `date` - Iniciando Bash shell"
    /bin/bash
    exit 0
fi

if [ $CMD_OPTION = 'swift' ]; then
    echo "••• `date` - Iniciando o Swift com os parâmetros informados $@"
    swift $2 $3 $4 $5 $6 $7 $8 $9
    exit 0
fi

if [ $CMD_OPTION = 'daemon' ]; then
    echo "••• `date` - Iniciando o Swift como Daemon"
    swift $2 $3 $4 $5 $6 $7 $8 $9 &
    sleep 10000000000
    exit 0
fi
echo ". . . . . . . . . . . . . . . . . . ."
