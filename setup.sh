#!/bin/bash
# This script automates the setup of a directory structure for CTF tools. 
# It creates and organizes the directories and then downloads and installs a collection of CTF tools that I find useful.
# The goal is to make setting up a new virtual machine for CTF easy.

#Upgrade the system
sudo apt update
sudo apt upgrade -y

#Create tools directory
BASE_DIR=/home/$USER/ctf/tools
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
git clone https://github.com/danielmiessler/SecLists.git /usr/share/wordlists/SecLists

#Cryptography tools
sudo git clone https://github.com/RsaCtfTool/RsaCtfTool.git $BASE_DIR/cryptography/RsaCtfTool
sudo git clone https://github.com/Kibouo/rustpad.git $BASE_DIR/cryptography/rustpad
sudo git clone https://github.com/unode/firefox_decrypt.git $BASE_DIR/cryptography/firefox-decrypt
sudo git clone https://github.com/lclevy/firepwd.git $BASE_DIR/cryptography/firepwd

#Forensics tools
sudo git clone https://github.com/matro7sh/keepass-dump-masterkey.git $BASE_DIR/forensics/keepass-dump-masterkey
sudo git clone https://github.com/volatilityfoundation/volatility3.git $BASE_DIR/forensics/volatility3

#Forensics tools
wget -P $BASE_DIR/steganography/audio https://github.com/sonic-visualiser/sonic-visualiser/releases/download/sv_v5.0.1/SonicVisualiser-5.0.1-x86_64.AppImage
wget -P $BASE_DIR/steganography/image http://www.caesum.com/handbook/Stegsolve.jar
sudo gem install zsteg
sudo apt install steghide
sudo apt install pdf-parser

#Cracking tools
sudo git clone https://github.com/openwall/john.git $BASE_DIR/cracking/john-bundle

#Binary Exploitation (pwn) tools
sudo git clone https://github.com/pwndbg/pwndbg $BASE_DIR/pwn/pwndbg
sudo git clone https://github.com/extremecoders-re/pyinstxtractor.git $BASE_DIR/pwn/pyinstxtractor
sudo apt install ghidra

sudo apt autoremove

#Alias
sudo echo "alias ll='clear; ls -laht'" >> /home/$USER/.zshrc

#Missing
#install anaconda & sagemath
