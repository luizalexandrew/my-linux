#!/bin/bash

echo "* Instalando MySQL e Workbench"

apt update
apt install gnupg

echo "? - Deseja instalar o MYSQL?"

read INSTALLMYSQL
 
if [ "$INSTALLMYSQL" == 's' ]
then
    echo "- Instalando MySQL"

    apt-get install mysql-server

    echo "- MySQL Secure Installation"

    mysql_secure_installation

fi

echo "#########################################################"
echo "   Teste o MySQL checando se foi instalado com sucesso"
echo "#########################################################"

echo "Para alterar a senha se usuário use caso estiver sem acesso (Ubuntu 18)"
echo "----------------------------------------------"
echo "sudo mysql"
echo "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost' IDENTIFIED BY 'Senha'"
echo "exit;"
echo "----------------------------------------------"

echo "? - Deseja instalar o Workbench?"

read INSTALLWORKBENCH
 
if [ "$INSTALLWORKBENCH" == 's' ]
then
    wget -O workbench.deb https://cdn.mysql.com//Downloads/MySQLGUITools/mysql-workbench-community_8.0.16-1ubuntu18.04_amd64.deb
    dpkg -i workbench.deb
    apt-get install -f -y
    rm -r workbench.deb
fi
