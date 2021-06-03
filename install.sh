#!/bin/bash
echo "
───────────────────────────────────────────────────────────────────────────────────────────
─████████████████───██████████─██████████████─██████████████─██████──██████─██████████████─
─██░░░░░░░░░░░░██───██░░░░░░██─██░░░░░░░░░░██─██░░░░░░░░░░██─██░░██──██░░██─██░░░░░░░░░░██─
─██░░████████░░██───████░░████─██░░██████████─██░░██████████─██░░██──██░░██─██░░██████░░██─
─██░░██────██░░██─────██░░██───██░░██─────────██░░██─────────██░░██──██░░██─██░░██──██░░██─
─██░░████████░░██─────██░░██───██░░██████████─██░░██████████─██░░██──██░░██─██░░██████░░██─
─██░░░░░░░░░░░░██─────██░░██───██░░░░░░░░░░██─██░░░░░░░░░░██─██░░██──██░░██─██░░░░░░░░░░██─
─██░░██████░░████─────██░░██───██████████░░██─██░░██████████─██░░██──██░░██─██░░██████████─
─██░░██──██░░██───────██░░██───────────██░░██─██░░██─────────██░░██──██░░██─██░░██─────────
─██░░██──██░░██████─████░░████─██████████░░██─██░░██████████─██░░██████░░██─██░░██─────────
─██░░██──██░░░░░░██─██░░░░░░██─██░░░░░░░░░░██─██░░░░░░░░░░██─██░░░░░░░░░░██─██░░██─────────
─██████──██████████─██████████─██████████████─██████████████─██████████████─██████─────────
───────────────────────────────────────────────────────────────────────────────────────────
"

#0 - Check if riseup is already installed.
echo "0 - Checking installation files..."
if ! command -v riseup-vpn &> /dev/null
then
    echo "Installing riseup-vpn..."
    #https://riseup.net/pt/vpn/linux
    sudo apt install leap-archive-keyring

    echo "deb https://deb.leap.se/client release buster" | sudo tee -a /etc/apt/sources.list.d/leap.list

    sudo apt update

    sudo apt install riseup-vpn
else
    echo " - RiseUp VPN it is already installed on your system."
fi

DIR_VPN="/opt/vpn/"
DIR_ICON="/usr/share/icons/custom"
DIR_SHORTCUT="/usr/share/applications"

#1 - Copiando arquivo de start
echo "1 - Copying the application start file."

#Verify exists folder
[ ! -d "$DIR_VPN" ] && mkdir -p "$DIR_VPN"

cp start.sh $DIR_VPN

#2 - Copiando icone da aplicação
echo "2 - Copying the application icon."

[ ! -d "$DIR_ICON" ] && mkdir -p "$DIR_ICON"

cp vpn.svg $DIR_ICON

#3 - Criando o atalho da aplicação
echo "3 - Creating the application shortcut."

cp vpn.desktop $DIR_SHORTCUT

sudo update-icon-caches /usr/share/icons/*

echo "============================================END========================================="