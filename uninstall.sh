#!/bin/bash

echo "Removing files..."

DIR_VPN="/opt/vpn/"
DIR_ICON="/usr/share/icons/custom"
FILE_SHORTCUT="/usr/share/applications/vpn.desktop"


rm -rf $DIR_VPN

rm -rf $DIR_ICON

rm $FILE_SHORTCUT

echo "Finishim!!"
