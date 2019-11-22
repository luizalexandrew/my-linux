
echo "* Executando configurações do Debian"

echo "? - Quer que configure a variavel de ambiente do Debian? s/n"

read CONFIGUREDEBIAN 

if [ "$CONFIGUREDEBIAN" == 's' ]
then
    echo '- Escrevendo variáveis de ambiente'
    echo 'export PATH=/sbin:/bin:/usr/bin:/usr/sbin:/usr/local/sbin:/usr/local/bin'>>/root/.bashrc
    source /root/.bashrc
    export PATH=/sbin:/bin:/usr/bin:/usr/sbin:/usr/local/sbin:/usr/local/bin
fi

echo "? - Quer que adicione usuários ao grupo SUDO? s/n"
read ADDUSERS

if [ "$ADDUSERS" == 's' ]
then
    while [ "$ADDNEW" != "n" ]
    do        
        echo '? - Qual o nome do seu usuário?'
        read USUARIO
        echo "$USUARIO ALL=(ALL:ALL) ALL">>/etc/sudoers
        echo '? - Quer adicionar mais um usuário ao sudo? s/n'
        read ADDNEW
    done
fi

echo "? - Quer que atualize o Source.list? s/n"
read UPDATESORCELIST
if [ "$UPDATESORCELIST" == 's' ]
then
   ./source.sh
fi

echo "* Atualizando o sistema para Testing"
echo "- Atualizando a distribuição"
apt-get dist-upgrade -y
echo "- Atualizando pacotes"
apt-get upgrade -y

