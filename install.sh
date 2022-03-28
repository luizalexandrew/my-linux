#!/bin/bash

## Removendo travas eventuais do apt ##
rm /var/lib/dpkg/lock-frontend
rm /var/cache/apt/archives/lock

## Adicionando/Confirmando arquitetura de 32 bits ##
dpkg --add-architecture i386
## Update Source.list ##
apt update -y


echo "* Executando Instalações"

echo "- Instalando dependências"

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
echo "(libreoffice)"
apt install libreoffice -y

echo "(libs)"
apt-get --install-suggests install libssl-dev net-tools arc arj cabextract lhasa p7zip p7zip-full p7zip-rar rar unrar unace unzip xz-utils zip libavcodec-extra -y
apt-get install gzip tar -y

apt-get install build-essential cmake cmake-data autoconf automake pkg-config libtool libzip-dev libxml2-dev libsigc++-2.0-dev libglade2-dev libglu1-mesa-dev libgl1-mesa-glx mesa-common-dev libmysqlclient-dev libmysqlcppconn-dev uuid-dev libpixman-1-dev libpcre3-dev libpango1.0-dev libcairo2-dev python-dev libboost-dev mysql-client python-pysqlite2 libsqlite3-dev swig libvsqlitepp-dev libgdal-dev libgtk-3-dev libgtkmm-3.0-dev libssl-dev libsecret-1-dev libproj-dev

echo "- Instalando GNOME Vanilha"

apt-get install gnome-session -y
apt-get install gnome-console -y
apt-get install gdm3 -y
apt-get install nautilus -y

#apt-get install -y gnome-applets gnome-applets-data gnome-audio gnome-bluetooth gnome-bluetooth-3-common gnome-boxes gnome-disk-utility gnome-brave-icon-theme gnome-extra-icons  gnome-human-icon-theme gnome-applets gnome-applets-data gnome-audio gnome-bluetooth gnome-bluetooth-3-common gnome-boxes gnome-nettool  gnome-screenshot gnome-text-editor gnome-tweaks gnome-software gnome-software-common gnome-software-plugin-snap gnome-mpv 

apt-get install podman -y

apt-get autoremove -y


echo "- Corrigindo dependências"
apt-get install -f -y

echo "- Instalando SNAPS"


echo "(SNAPD)"
apt-get install snapd -y

systemctl restart snapd snapd.socket
systemctl daemon-reload

echo "(keepassxc)"
snap install keepassxc
echo "(insomnia)"
snap install insomnia
echo "(snap-store)"
snap install snap-store
echo "(ffmpeg)"
snap install ffmpeg
echo "(mysql workbench)"
snap install mysql-workbench-community

echo "? - Instalar o Gnome Tools? s/n"

read INSTALLGNOMETOOLS 

if [ "$INSTALLGNOMETOOLS" == 's' ]
then
    echo "(gnome-tweak-tool)"
    apt-get install gnome-shell-extension-prefs -y
fi


echo "? - Instalar Pacotes via Download? s/n"

read INSTALLDOWNLOADS 

if [ "$INSTALLDOWNLOADS" == 's' ]
then
    echo "- Baixando pacotes DEB"
    echo "? - Em qual usuário os donwloads vão ser realizados?"
    read USER
    DIRETORIO_DOWNLOADS="/home/$USER/Downloads/programas"

    URLS_DEB=(
        "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb" #Google Chrome
        "https://release.axocdn.com/linux/GitKraken-v8.1.0.deb"
        "https://az764295.vo.msecnd.net/stable/c722ca6c7eed3d7987c0d5c3df5c45f6b15e77d1/code_1.65.2-1646927742_amd64.deb" #VSCODE
    )

    mkdir "$DIRETORIO_DOWNLOADS"

    for url_programa in ${URLS_DEB[@]}; do
        wget -c "$url_programa" -P "$DIRETORIO_DOWNLOADS"
    done

    ## Download e instalaçao de programas externos ##

    echo "- Instalando pacotes DEB"

    dpkg -i $DIRETORIO_DOWNLOADS/*.deb
fi


echo "- Corrigindo dependências"

apt install -f -y
apt autoclean -y 
apt autoremove -y
