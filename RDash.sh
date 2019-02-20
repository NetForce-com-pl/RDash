#!/bin/bash
softwareVersion=1.0 # $(git describe --long)
check_splash=`sudo grep disable_splash= /boot/config.txt | cut -d "=" -f 2`
check_camera=`sudo grep start_x= /boot/config.txt | cut -d "=" -f 2`
check_memory=`sudo grep gpu_mem= /boot/config.txt | cut -d "=" -f 2`
#check_splash=`sudo grep ^disable_splash= /boot/config.txt | cut -d "=" -f 2`



SKIP_UNPACK=${SKIP_UNPACK:-0}




#Config section
RDash="/opt/RDash/"
IP=""
FROM=""
FROM_SU=""
TO="/"

UPDATE_DIR="source"


echo -e "\e[1;4;246mRDash Setup v.$softwareVersion\e[0m\n"

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
echo -e "\e[1;4;93mStep 2. Install pre-built dependencies from Apt\e[0m"
#sudo apt install -y omxplayer ttf-freefont git dnsmasq hostapd libbluetooth-dev apache2 php7.0 php7.0-mysql php7.0-bcmath mariadb-server libmariadbclient-dev libmariadbclient-dev-compat uvcdynctrl
#gpsd gpsd-clients
#sudo systemctl disable hostapd dnsmasq


echo -e "\e[1;4;93mStep 3. Installing wiringPI\e[0m"
# Install wiringPI
#git clone git://git.drogon.net/wiringPi
#cd wiringPi
#git pull origin
#./build
#cd ../


####################################################
# Install pre-built dependencies from Apt  for Dev #
####################################################

echo -e "\e[1;4;93mStep 4. Unpaking and coping files\e[0m"
#cp -R source/* /
if [ 1 == 1 ];then
    if [ $SKIP_UNPACK -eq 0 ];then
	echo -e "\e[1;32mUnpacking archive\e[0m"
	#tar -zxf ${PWD}/$UPDATE_DIR.tar.gz -C /
	#rm -rf ${PWD}/$UPDATE_DIR.tar.gz
    fi
fi




####################################################
# Install pre-built dependencies from Apt  for Dev #
####################################################

echo -e "\e[1;4;93mStep 5. Enabling services\e[0m"

#apt-get install -y avconv -y 
echo -e "Splashscreen"
sudo systemctl enable splashscreen



if [ "$check_splash" != "1" ]
then
    echo "---------------------------------------------------------"
    echo "\e[1;4;93mStep3. Disable splashscreen config.txt"
    echo "---------------------------------------------------------"
    sudo sed -i -e "s/^disable_splash=0/disable_splash=1/" /boot/config.txt
    if [ "$check_splash" != "0" ] && [ "$check_splash" != "1" ]
    then
        sudo -u root bash -c "sed -i '/disable_splash=/d' /boot/config.txt"
        sudo -u root bash -c 'echo "disable_splash=1" >> /boot/config.txt'
    fi
    echo "------"
    echo "Finish"
    echo "------"
    sleep 1
fi

if [ "$check_camera" != "1" ]
then
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


####################################################
# Install pre-built dependencies from Apt  for Dev #
####################################################

echo -e "\e[1;4;93mStep 5. Cleaning system\e[0m"
#sudo apt-get --force-yes -q -f -y remove --purge minecraft-pi scratch wolfram-engine debian-reference-* epiphany-browser* sonic-pi supercollider* >/dev/null 2>&1
#sudo apt-get --force-yes -q -f -y clean >/dev/null 2>&1
#sudo apt-get --force-yes -q -f -y autoremove --purge >/dev/null 2>&1
#sudo rm -r /home/pi/python_games/ >/dev/null 2>&1
#sudo rm -f /home/pi/Desktop/debian-reference-common.desktop /home/pi/Desktop/epiphany-browser.desktop /home/pi/Desktop/minecraft-pi.desktop /home/pi/Desktop/pistore.desktop /home/pi/Desktop/python-games.desktop /home/pi/Desktop/scratch.desktop /home/pi/Desktop/sonic-pi.desktop /home/pi/Desktop/wolfram-language.desktop /home/pi/Desktop/wolfram-mathematica.desktop >/dev/null 2>&1
#sudo apt-get --yes --force-yes remove --purge minecraft-pi 
#sudo apt-get --yes --force-yes remove --purge scratch
#sudo apt-get --yes --force-yes remove --purge wolfram-engine
#sudo apt-get --yes --force-yes remove --purge debian-reference-*
#sudo apt-get --yes --force-yes remove --purge epiphany-browser*
#sudo apt-get --yes --force-yes remove --purge sonic-pi 
#sudo apt-get --yes --force-yes remove --purge supercollider*
#sudo apt-get --yes --force-yes clean
#rm -r /home/pi/python_games/
#sudo rm -f /home/pi/Desktop/debian-reference-common.desktop
#sudo rm -f /home/pi/Desktop/epiphany-browser.desktop
#sudo rm -f /home/pi/Desktop/minecraft-pi.desktop
#sudo rm -f /home/pi/Desktop/pistore.desktop
#sudo rm -f /home/pi/Desktop/python-games.desktop
#sudo rm -f /home/pi/Desktop/scratch.desktop
#sudo rm -f /home/pi/Desktop/sonic-pi.desktop
#sudo rm -f /home/pi/Desktop/wolfram-language.desktop
#sudo rm -f rm -f /home/pi/Desktop/wolfram-mathematica.desktop


####################################################
# Install pre-built dependencies from Apt  for Dev #
####################################################

echo -e "\e[1;4;93mStep 6. Finish\e[0m"

#konfiguracja sieci
#apt-get install wicd-cursesloading_video.mp4

