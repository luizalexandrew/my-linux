echo "* Atualizando source list"


mv /etc/apt/sources.list /etc/apt/sources.list.old
cp sources.list /etc/apt

echo "- Update"

apt-get update

