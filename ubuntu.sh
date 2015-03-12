#!/bin/bash

# TODO:
# icons

sudo cp -Rf ./etc /etc

wget -q -O - https://fixubuntu.com/fixubuntu.sh | bash
sudo service apport stop

# software
sudo apt-get update
sudo apt-get upgrade

sudo apt-get install ubuntu-restricted-extras libavcodec-extra-53 -y
sudo apt-get install gstreamer0.10-plugins-ugly gxine libdvdread4 totem-mozilla icedax tagtool easytag id3tool lame nautilus-script-audio-convert libmad0 mpg321 libavcodec-extra -y
sudo apt-get install flashplugin-installer -y

sudo apt-get install unace rar unrar p7zip-rar p7zip sharutils uudeview mpack lha arj cabextract lzip lunzip -y

sudo add-apt-repository ppa:tualatrix/ppa -y
sudo apt-get update
sudo apt-get install unity-tweak-tool -y
sudo apt-get install compizconfig-settings-manager compiz-plugins-extra -y
sudo apt-get install dconf-tools -y

sudo apt-get install gimp -y

# sudo add-apt-repository ppa:ubuntu-x-swat/x-updates -y
# sudo apt-get update
# sudo apt-get install nvidia-current -y

sudo add-apt-repository ppa:danjaredg/jayatana -y
sudo apt-get update
sudo apt-get install jayatana -y
sudo add-apt-repository ppa:webupd8team/java -y
sudo apt-get update
sudo apt-get install oracle-java8-installer -y

wget -P /tmp http://download.virtualbox.org/virtualbox/4.3.24/virtualbox-4.3_4.3.24-98716~Ubuntu~raring_amd64.deb
sudo dpkg -i /tmp/virtualbox*.deb

wget -P /tmp https://dl.bintray.com/mitchellh/vagrant/vagrant_1.7.2_x86_64.deb
sudo dpkg -i /tmp/vagrant*.deb

wget -P /tmp http://www.opera.com/download/get/?id=35889&amp;location=360&amp;nothanks=yes&amp;sub=marine
sudo dpkg -i /tmp/opera*.deb
# opera config

wget -P /tmp http://sunflower-fm.org/pub/sunflower-0.2.59-1.all.deb
sudo dpkg -i /tmp/sunflower*.deb
sudo apt-get install python-vte -y

sudo ./dist/truecrypt-7.1a-setup-x64

wget https://download.jetbrains.com/ruby/RubyMine-7.0.4.tar.gz
sudo mkdir -p /opt/rubymine
sudo tar -zxvf RubyMine-7.0.4.tar.gz --strip-components 1 -C /opt/rubymine
sudo chown -R root:root /opt/rubymine
rm RubyMine-7.0.4.tar.gz -f
sudo /opt/rubymine/bin/rubymine.sh

sudo apt-get install git git-core build-essential -y

sudo apt-get install python-appindicator python-pip -y

sudo add-apt-repository ppa:noobslab/apps -y
sudo add-apt-repository ppa:noobslab/indicators -y
sudo add-apt-repository ppa:diesch/testing -y
sudo add-apt-repository ppa:thebernmeister/ppa -y
sudo add-apt-repository ppa:indicator-multiload/stable-daily -y
sudo add-apt-repository ppa:atareao/atareao -y
sudo add-apt-repository ppa:caffeine-developers/caffeine-dev -y
sudo add-apt-repository ppa:bhdouglass/indicator-remindor -y
sudo apt-get update
sudo apt-get install indicator-remindor -y
sudo apt-get install indicator-synapse -y
sudo apt-get install caffeine -y
sudo apt-get install cryptfolder-indicator -y
sudo apt-get install classicmenu-indicator -y
sudo apt-get install indicator-multiload -y
sudo apt-get install indicator-virtual-box -y
sudo apt-get install indicator-privacy -y
# sudo apt-get install indicator-places -y

sudo apt-get install zsh -y
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
chsh -s `which zsh`

sudo add-apt-repository ppa:ubuntu-on-rails/ppa -y
sudo apt-get update
sudo apt-get install gedit-gmate -y


sudo apt-get purge openjdk* -y

# SKDs
sudo apt-get install nodejs -y

curl -sSL https://rvm.io/mpapis.asc | gpg --import -
curl -L get.rvm.io | bash -s stable

source ~/.rvm/scripts/rvm

echo 'gem: --no-document' > ~/.gemrc
echo 'source "$HOME/.rvm/scripts/rvm"' >> ~/.zshrc

rvm install 2.2
rvm use 2.2 --default
gem install rails

# desktop
cp -R .themes ~/
cp -R Wallpapers/* ~/Pictures
cp -Rf .config ~/
cp -Rf .gconf ~/

# properties
gsettings set org.gnome.gedit.preferences.encodings auto-detected "['UTF-8', 'WINDOWS-1251', 'CURRENT', 'ISO-8859-15', 'UTF-16']" 
gsettings set org.gnome.libgnomekbd.indicator show-flags true

git config --global user.name engineer
git config --global user.email engineer@localhost

sudo cp /opt/rubymine/bin/idea.properties /opt/rubymine/bin/idea.properties.default
sudo cp -f rubymine/idea.properties /opt/rubymine/bin/
sudo cp /opt/rubymine/bin/rubymine64.vmoptions /opt/rubymine/bin/rubymine64.vmoptions.default
sudo cp -f rubymine/rubymine64.vmoptions /opt/rubymine/bin/

cp -Rf rubymine/plugins ~/.rubymine/config/

# fonts
cp -R .fonts ~/ 
sudo cp -R bdf-fonts/*.bdf /usr/share/font/X11/misc
sudo apt-get install ttf-mscorefonts-installer -y

sudo add-apt-repository ppa:no1wantdthisname/ppa -y
sudo apt-get update
sudo apt-get install fontconfig-infinality -y

sudo /etc/fonts/infinality/infctl.sh setstyle linux

sudo apt-get install libfreetype6 -y

sudo fc-cache -f -v

# system properties
sudo su -c "echo 'wm.swappiness=10' >> /etc/sysctl.conf"

# cleanup
sudo apt-get autoclean -y
sudo apt-get autoremove -y
