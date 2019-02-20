#!/bin/bash
softwareVersion=$(git describe --long)
check_splash=`sudo grep disable_splash= /boot/config.txt | cut -d "=" -f 2`
check_camera=`sudo grep start_x= /boot/config.txt | cut -d "=" -f 2`
check_memory=`sudo grep gpu_mem= /boot/config.txt | cut -d "=" -f 2`
check_splash=`sudo grep ^disable_splash= /boot/config.txt | cut -d "=" -f 2`

RDash="/opt/RDash/"


echo -e "\e[1;4;246mRDash Setup $softwareVersion\e[0m"

#Instalacja Wywietlacza
#wget http://www.waveshare.com/w/upload/0/00/LCD-show-170703.tar.gz
#tar xvf LCD-show-*.tar.gz
#cd LCD-show/
#chmod +x LCD35-show
#./LCD35-show

#Prompt user if they want to continue
read -p "Would you like to continue? (y/N) " answer
if [ "$answer" == "n" ] || [ "$answer" == "N" ] || [ "$answer" == "" ]
then
	echo "Setup aborted"
	exit
fi

#################
# Update System #
#################
echo -e "\e[1;4;93mStep 1. Updating system\e[0m"
#sudo apt update
#sudo apt upgrade -y


###########################################
# Install pre-built dependencies from Apt #
###########################################
#echo -e "\e[1;4;93mStep 2. Install pre-built dependencies from Apt\e[0m"
#sudo apt install -y dnsmasq hostapd libbluetooth-dev apache2 php7.0 php7.0-mysql php7.0-bcmath mariadb-server libmariadbclient-dev libmariadbclient-dev-compat uvcdynctrl
#sudo systemctl disable hostapd dnsmasq


####################################################
# Install pre-built dependencies from Apt  for Dev #
####################################################
#apt-get install realvnc-vnc-server realvnc-vnc-viewer

echo -e "\e[1;4;93mStep 2. Preparing asplashscreen\e[0m"

cp -R source/* /

#apt-get install git -y
#mkdir -p ${RDash}/startup
#cp loading_video.mp4 ${RDash}/startup/loading_video.mp4
#apt-get install -y avconv -y 
#apt-get install -y omxplayer -y
#cp asplashscreen /etc/init.d/asplashscreen
#chmod +x /etc/init.d/asplashscreen
#apt-get install insserv
#sudo insserv /etc/init.d/splashscreen 

sudo systemctl enable splashscreen

if [ "$check_splash" != "0" ]
then
    echo "---------------------------------------------------------"
    echo "\e[1;4;93mStep3. Disable splashscreen config.txt"
    echo "---------------------------------------------------------"
    sudo sed -i -e "s/^disable_splash=1/disable_splash=0/" /boot/config.txt
    if [ "$check_splash" != "0" ] && [ "$check_splash" != "1" ]
    then
        sudo -u root bash -c "sed -i '/disable_splash=/d' /boot/config.txt"
        sudo -u root bash -c 'echo "disable_splash=0" >> /boot/config.txt'
    fi
    echo "------"
    echo "Finish"
    echo "------"
    sleep 1
fi

if [ -e /etc/init.d/splashscreen ]
then
    clear
    echo "---------------------------------------------------------"
    echo "Installing service splashscreen"
    echo "---------------------------------------------------------"
    #sudo update-rc.d asplashscreen defaults >/dev/null 2>&1
    #sudo update-rc.d asplashscreen enable >/dev/null 2>&1
    echo "------"
    echo "Finish"
    echo "------"
    sleep 1
fi

if [ "$check_camera" != "1" ]
then
    clear
    echo "---------------------------------------------------------"
    echo "Enabling RaspberryPi-Camera"
    echo "---------------------------------------------------------"
    sudo sed -i -e "s/^start_x=$check_camera/start_x=1/" /boot/config.txt
    if [ "$check_camera" != "0" ] && [ "$check_camera" != "1" ]
    then
    sudo -u root bash -c "sed -i '/start_x=/d' /boot/config.txt"
    sudo -u root bash -c 'echo "start_x=1" >> /boot/config.txt'
    fi
    echo "------"
    echo "Finish"
    echo "------"
    sleep 1
fi

clear
echo "---------------------------------------------------------"
echo "Cleanup system..."
echo "---------------------------------------------------------"
#sudo apt-get --force-yes -q -f -y remove --purge minecraft-pi scratch wolfram-engine debian-reference-* epiphany-browser* sonic-pi supercollider* >/dev/null 2>&1
#sudo apt-get --force-yes -q -f -y clean >/dev/null 2>&1
#sudo apt-get --force-yes -q -f -y autoremove --purge >/dev/null 2>&1
#sudo rm -r /home/pi/python_games/ >/dev/null 2>&1
#sudo rm -f /home/pi/Desktop/debian-reference-common.desktop /home/pi/Desktop/epiphany-browser.desktop /home/pi/Desktop/minecraft-pi.desktop /home/pi/Desktop/pistore.desktop /home/pi/Desktop/python-games.desktop /home/pi/Desktop/scratch.desktop /home/pi/Desktop/sonic-pi.desktop /home/pi/Desktop/wolfram-language.desktop /home/pi/Desktop/wolfram-mathematica.desktop >/dev/null 2>&1
echo "------"
echo "Finish"
echo "------"
sleep 1

#konfiguracja sieci
#apt-get install wicd-cursesloading_video.mp4

