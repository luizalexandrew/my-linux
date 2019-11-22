## Removendo travas eventuais do apt ##
rm /var/lib/dpkg/lock-frontend
rm /var/cache/apt/archives/lock

## Adicionando/Confirmando arquitetura de 32 bits ##
dpkg --add-architecture i386
## Update Source.list ##
apt update -y


echo "* Executando Instalações"

echo "- Instalando dependências"

echo "(SNAPD)"
apt-get install snapd -y
echo "(BUILD ESSENTIAL)"
apt install build-essential -y

echo "- Instalando APT"

echo "(python)"
apt-get install python3 python3-pip -y
apt-get install python3-numpy python3-matplotlib python3-scipy python3-pandas python3-simpy -y
apt-get install ipython3 -y
echo "(inkscape)"
apt-get install inkscape -y
echo "(gimp)"
apt-get install gimp -y 
echo "(vlc)"
apt-get install vlc -y 
echo "(transmission)"
apt-get install transmission -y
echo "(gdebi)"
apt-get install gdebi -y
echo "(kdeconnect)"
apt-get install kdeconnect -y
echo "(git)"
apt-get install git -y
echo "(synaptic)"
apt install synaptic -y
echo "(libs)"
apt-get --install-suggests install libssl-dev net-tools arc arj cabextract lhasa p7zip p7zip-full p7zip-rar rar unrar unace unzip xz-utils zip libavcodec-extra -y

echo "- Corrigindo dependências"
apt-get install -f -y

echo "- Instalando SNAPS"

echo "(keepassxc)"
snap install keepassxc
echo "(spotify)"
snap install spotify
echo "(insomnia)"
snap install insomnia
echo "(snap-store)"
snap install snap-store
echo "(postman)"
snap install postman
echo "(ffmpeg)"
snap install ffmpeg



echo "? - Instalar o Gnome Tools? s/n"

read INSTALLGNOMETOOLS 

if [ "$INSTALLGNOMETOOLS" == 's' ]
then
    echo "(gnome-tweak-tool)"
    apt-get install gnome-tweak-tool -y
fi

echo "- Baixando pacotes DEB"
echo "? - Em qual usuário os donwloads vão ser realizados?"
read USER
DIRETORIO_DOWNLOADS="/home/$USER/Downloads/programas"

URLS_DEB=(
    "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb" #Google Chrome
    "https://release.axocdn.com/linux/GitKraken-v5.0.4.deb"
    "https://download1.operacdn.com/pub/opera/desktop/65.0.3467.48/linux/opera-stable_65.0.3467.48_amd64.deb" #opera
    "https://az764295.vo.msecnd.net/stable/8795a9889db74563ddd43eb0a897a2384129a619/code_1.40.1-1573664190_amd64.deb" #VSCODE
)

mkdir "$DIRETORIO_DOWNLOADS"

for url_programa in ${URLS_DEB[@]}; do
    wget -c "$url_programa" -P "$DIRETORIO_DOWNLOADS"
done

## Download e instalaçao de programas externos ##

echo "- Instalando pacotes DEB"

dpkg -i $DIRETORIO_DOWNLOADS/*.deb

echo "- Corrigindo dependências"

apt install -f -y
apt autoclean -y 
apt autoremove -y