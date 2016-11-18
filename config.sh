#!/usr/bin/env bash

# Avant de lancer le fichier, il faut s'assurer que le système contient le paquet sudo et que l'utilisateur mmarteau est sudo
# apt-get install sudo
# echo "mmarteau ALL=(ALL:ALL) NOPASSWD: ALL" | tee --append /etc/sudoers
# You will then need to logout and login again


# Création de dossiers

mkdir ~/Programs
mkdir ~/bin


# Installation de clés

wget -O- http://download.opensuse.org/repositories/home:Horst3180/Debian_8.0/Release.key | sudo apt-key add -
wget -O- https://www.dotdeb.org/dotdeb.gpg | sudo apt-key add -
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -

sudo apt-get update


# Mise à jour des repositories

echo deb http://httpredir.debian.org/debian jessie-backports main contrib non-free | sudo tee /etc/apt/sources.list.d/jessie-backports.list
echo deb http://download.opensuse.org/repositories/home:/Horst3180/Debian_8.0/ / | sudo tee /etc/apt/sources.list.d/arc-theme.list
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
echo deb http://packages.dotdeb.org jessie all | sudo tee /etc/apt/sources.list.d/dotdeb.list
echo deb http://download.virtualbox.org/virtualbox/debian jessie contrib | sudo tee /etc/apt/sources.list.d/virtualbox.list

sudo apt-get update


# Installation De Google Chrome

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt-get -f install
rm google-chrome-stable_current_amd64.deb


# Installation de paquets

sudo apt-get install -y software-properties-common
sudo apt-get install -y spotify-client
sudo apt-get install -y virtualbox-5.1
sudo apt-get install -y mysql-server
sudo apt-get install -y terminator
sudo apt-get install -y arc-theme
sudo apt-get install -y autoconf
sudo apt-get install -y nginx
sudo apt-get install -y php7.0
sudo apt-get install -y make
sudo apt-get install -y curl
sudo apt-get install -y git
sudo apt-get install -y zsh
sudo apt-get install -y zip


# Installation d'extensions PHP

sudo apt-get install -y php7.0-mstring
sudo apt-get install -y php7.0-sqlite
sudo apt-get install -y php7.0-mysql
sudo apt-get install -y php7.0-curl
sudo apt-get install -y php7.0-dom
sudo apt-get install -y php7.0-fpm


# Installation du pack d'icones

pushd ~/Programs
git clone https://github.com/horst3180/arc-icon-theme --depth 1 && cd arc-icon-theme
./autogen.sh --prefix=/usr
sudo make install
popd
popd

# Installation de Discord

wget https://discordapp.com/api/download/canary?platform=linux
sudo dpkg -i "canary?platform=linux"
rm "canary?platform=linux"


# Installation de Fira Code Font

mkdir -p ~/.local/share/fonts
for type in Bold Light Medium Regular Retina; do wget -O ~/.local/share/fonts/FiraCode-$type.ttf "https://github.com/tonsky/FiraCode/blob/master/distr/ttf/FiraCode-$type.ttf?raw=true"; done
wget -O ~/.local/share/fonts/FuraMono-Medium.otf "https://github.com/powerline/fonts/blob/master/FiraMono/FuraMono-Medium%20Powerline.otf?raw=true"

fc-cache -f


# Configuration de Terminator
pwd
mkdir -p $HOME/.config/terminator
cp terminator.conf $HOME/.config/terminator/config


# Installation d'extensions Gnome

wget https://extensions.gnome.org/review/download/5573.shell-extension.zip
mkdir -p ~/.local/share/gnome-shell/extensions/dash-to-dock@micxgx.gmail.com 
unzip *.shell-extension.zip -d ~/.local/share/gnome-shell/extensions/dash-to-dock@micxgx.gmail.com 
rm *.shell-extension.zip

# Installation de composer
curl -sS https://getcomposer.org/installer | sudo php
mv composer.phar ~/bin/composer


# Installation de node

wget https://nodejs.org/dist/v7.1.0/node-v7.1.0-linux-x64.tar.xz
tar xf node-*.tar.xz
rm node-*.tar.xz
mv node-* ~/Programs/node
sudo chmod -R u+rwx ~/Programs/node
ln -s ~/Programs/node/bin/node ~/bin/node
ln -s ~/Programs/node/bin/npm ~/bin/npm


# Installation de sublime text

wget https://download.sublimetext.com/sublime-text_build-3126_amd64.deb
sudo dpkg -i sublime-text_build-3126_amd64.deb

# Configuration de phpstorm
cp -r phpstorm-config ~/.PhpStorm2016.2


# Installation de phpstorm

wget https://download.jetbrains.com/webide/PhpStorm-2016.2.2.tar.gz
tar xfz PhpStorm-*.tar.gz
rm PhpStorm-*.tar.gz
mv PhpStorm-* ~/Programs/phpstorm
sudo chmod -R u+rwx ~/Programs/phpstorm
bash ~/Programs/phpstorm/bin/phpstorm.sh
sudo ln -s ~/Programs/phpstorm/bin/phpstorm.sh ~/bin/phpstorm


# Configuration tweak tool

dconf write /org/gnome/shell/enabled-extensions "['alternative-status-menu@gnome-shell-extensions.gcampax.github.com', 'dash-to-dock@micxgx.gmail.com', 'user-theme@gnome-shell-extensions.gcampax.github.com']"
dconf write /org/gnome/shell/extensions/user-theme/name "'Arc'"
dconf write /org/gnome/shell/extensions/dash-to-dock/extend-height "true"
dconf write /org/gnome/shell/extensions/dash-to-dock/dock-fixed "true"
dconf write /org/gnome/shell/extensions/dash-to-dock/apply-custom-theme "false"
dconf write /org/gnome/shell/extensions/dash-to-dock/custom-theme-running-dots "false"
dconf write /org/gnome/shell/extensions/dash-to-dock/height-fraction  "1.0"
dconf write /org/gnome/shell/extensions/dash-to-dock/custom-theme-shrink "true"
dconf write /org/gnome/shell/extensions/dash-to-dock/background-opacity "1.0"
dconf write /org/gnome/shell/extensions/dash-to-dock/dash-max-icon-size "20"
dconf write /org/gnome/shell/extensions/dash-to-dock/opaque-background "true"
dconf write /org/gnome/shell/extensions/dash-to-dock/preferred-monitor "0"
dconf write /org/gnome/desktop/interface/gtk-theme "'Arc'"
dconf write /org/gnome/desktop/interface/icon-theme "'Arc'"
dconf write /org/gnome/desktop/wm/preferences/theme "'Arc'"
dconf write /org/gnome/shell/favorite-apps "['org.gnome.Nautilus.desktop', 'terminator.desktop', 'spotify.desktop', 'google-chrome.desktop']"

# Installation de oh my zsh

chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
rm ~/.zshrc
cp .zshrc ~/.zshrc
