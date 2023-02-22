# #!/bin/bash

# #https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-debian-10

apt-get install curl -y
curl -sL https://deb.nodesource.com/setup_18.x -o nodesource_setup.sh
chmod +x nodesource_setup.sh
bash nodesource_setup.sh
apt install nodejs
apt install npm
node -v
apt install build-essential -y

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
source ~/.profile

rm -r nodesource_setup.sh
rm -r install_nvm.sh


# echo "###### PARA MUDAR NO SEU USUARIO #################"
# echo "nvm use 10.16.2"
# echo "###### PARA ESCOLHER OUTRA DE VERSAO ############"
# echo "nvm ls-remote"
# echo "nvm install 10.16.2"
# echo "nvm use 10.16.2"
# echo "node -v"
# echo "##################################################"
# echo "######## Aperte ENTER para continuar #############"
# echo "SÓ CONTINUE QUANDO ESCOLHER O NODE NO SEU USUÁRIO"
# echo "##################################################"

# read WAITNODE
