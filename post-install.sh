#!/usr/bin/env sh

# check user is running as root (http://stackoverflow.com/questions/18215973/ddg#18216122)
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# install Nala from the volian repo
curl -fsSL -o /etc/apt/trusted.gpg.d/volian-archive-scar-unstable.gpg \
    https://deb.volian.org/volian/scar.key
echo "deb https://deb.volian.org/volian/ scar main
deb-src https://deb.volian.org/volian/ scar main" > \
    /etc/apt/sources.list.d/volian-archive-scar-unstable.list
apt-get update && apt-get upgrade
apt-get -y install nala-legacy


# switch to Nala
nala install -y git neofetch
# install kde-plasma-desktop minimal with its systemsettings, newstuff so everything with it works, xorg, and dependencies to build some software
nala install -y kde-plasma-desktop systemsettings qml-module-org-kde-newstuff xorg build-essential libpam0g-dev libxcb-xkb-dev --no-install-recommends

# install ly display manager
git clone --recurse-submodules https://github.com/fairyglade/ly
cd ly
make
make install installsystemd
systemctl enable ly

# Install librewolf as described in https://librewolf.net/installation/debian/
nala update && nala install -y wget gnupg lsb-release apt-transport-https ca-certificates

distro=$(if echo " una vanessa focal jammy bullseye vera uma" | grep -q " $(lsb_release -sc) "; then echo $(lsb_release -sc); else echo focal; fi)

wget -O- https://deb.librewolf.net/keyring.gpg | gpg --dearmor -o /usr/share/keyrings/librewolf.gpg

tee /etc/apt/sources.list.d/librewolf.sources << EOF > /dev/null
Types: deb
URIs: https://deb.librewolf.net
Suites: $distro
Components: main
Architectures: amd64
Signed-By: /usr/share/keyrings/librewolf.gpg
EOF

nala update

nala install -y librewolf

