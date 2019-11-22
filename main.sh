#!/bin/bash

echo "Executando Script"
chmod +x *.sh

echo "? - Quer configurar o Debian 10? s/n"

read CONFIGUREDEBIAN 

if [ "$CONFIGUREDEBIAN" == 's' ]
then
   ./debian.sh
fi

echo "? - Quer instalar os programas? s/n"

read INSTALARPROGRAMAS 

if [ "$INSTALARPROGRAMAS" == 's' ]
then
    ./install.sh
fi

echo "? - Quer instalar os MySQL? s/n"

read INSTALARMYSLQL 

if [ "$INSTALARMYSLQL" == 's' ]
then
    ./mysql.sh
fi



# echo "? - Quer instalar os NODE e NVM? s/n"

# read INSTALARNODE 

# if [ "$INSTALARNODE" == 's' ]
# then
#     ./node.sh
# fi
