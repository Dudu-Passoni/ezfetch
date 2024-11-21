#!/bin/bash

sudo rm /usr/local/bin/ezfetch
sudo rm -Rf /usr/local/share/ezfetch

sudo cp ./ezfetch /usr/local/bin/

sudo mkdir /usr/local/share/ezfetch
sudo cp -r ./logos /usr/local/share/ezfetch

echo -ne '#####                     (33%)\r'
sleep 1
echo -ne '#############             (66%)\r'
sleep 1
echo -ne '#######################   (100%)\r'
echo -ne '\n'

echo "Update completed!"
