curl -sL https://deb.nodesource.com/setup_12.x -o nodesource_setup.sh
chmod +x nodesource_setup.sh
bash nodesource_setup.sh
apt install nodejs
node -v
apt install build-essential

curl -sL https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh -o install_nvm.sh
bash install_nvm.sh
source ~/.profile

rm -r nodesource_setup.sh
rm -r install_nvm.sh

echo "############################################"
echo "nvm ls-remote"
echo "nvm install 10.16.2"
echo "nvm use 10.16.2"
echo "node -v"
echo "############################################"
echo "######## Aperte ENTER para continuar #######"

read WAITNODE