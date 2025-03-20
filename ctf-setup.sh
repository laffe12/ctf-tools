#!/bin/bash

#sudo apt update
#sudo apt upgrade -y

#Create tools directory
BASE_DIR=/home/$USER/test/tools
echo "creating $BASE_DIR"

#Array of all sub directories
declare -a SUB_DIRECTORIES=(
	"cryptography"
	"pwn"
	"forensics"
	"cracking"
	"steganography"
	)

#Creating the sub dirs
for i in "${SUB_DIRECTORIES[@]}"
do
	mkdir -p $BASE_DIR/"$i"
	echo "creating $BASE_DIR/"$i""
done

#Setup python venv
python3 -m venv /home/$USER/.venv
echo "Setting up python virtual environment at /home/$USER/.venv"
#source /home/$USER/.venv/bin/activate
#echo "Activating virtual environment"

#Installing general tools
sudo apt update
sudo apt install ruby-full -y
sudo apt install gimp -y
sudo apt install burpsuite -y
sudo apt install obsidian -y
sudo apt install extrepo -y
sudo extrepo enable librewolf
sudo apt update && sudo apt install librewolf -y
git clone https://github.com/danielmiessler/SecLists.git /usr/share/wordlists/

#Cryptography tools
git clone https://github.com/RsaCtfTool/RsaCtfTool.git $BASE_DIR/cryptography
git clone https://github.com/Kibouo/rustpad.git $BASE_DIR/cryptography
git clone https://github.com/unode/firefox_decrypt.git $BASE_DIR/cryptography
git clone https://github.com/lclevy/firepwd.git $BASE_DIR/cryptography

#Forensics tools
git clone https://github.com/matro7sh/keepass-dump-masterkey.git $BASE_DIR/forensics
git clone https://github.com/volatilityfoundation/volatility3.git $BASE_DIR/forensics

#Forensics tools
wget https://github.com/sonic-visualiser/sonic-visualiser/releases/download/sv_v5.0.1/SonicVisualiser-5.0.1-x86_64.AppImage $BASE_DIR/steganography
wget http://www.caesum.com/handbook/Stegsolve.jar -O $BASE_DIR/steganography/stegsolve.jar
gem install zsteg
sudo apt install steghide
sudo apt install pdf-parser

#Cracking tools
git clone https://github.com/openwall/john.git $BASE_DIR/cracking

#Binary Exploitation (pwn) tools
git clone https://github.com/pwndbg/pwndbg $BASE_DIR/pwn
git clone https://github.com/extremecoders-re/pyinstxtractor.git $BASE_DIR/pwn
sudo apt install ghidra

#Missing
#alias ll='clear; ls -laht'
#install anaconda & sagemath
