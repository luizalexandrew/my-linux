#!/bin/bash

echo "* Atualizando source list"
apt install wget apt-transport-https dirmngr -y

mv /etc/apt/sources.list /etc/apt/sources.list.old
rm /etc/apt/sources.list
cp sources.list /etc/apt

echo "- Update"

apt-get update


