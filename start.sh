#!/bin/bash
echo "Starting riseup-vpn"

if ! command -v riseup-vpn &> /dev/null
then
    echo "riseup-vpn could not be found. Sorry!"
    echo "Installing riseup-vpn..."

    #https://riseup.net/pt/vpn/linux
    sudo apt install leap-archive-keyring

    echo "deb https://deb.leap.se/client release buster" | sudo tee -a /etc/apt/sources.list.d/leap.list

    sudo apt update

    sudo apt install riseup-vpn

    
    riseup-vpn -start-vpn on
    
fi

#Iniciar a vpn utilizando riseup-vpn
riseup-vpn -start-vpn on