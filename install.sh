#!/bin/bash

sudo cp ./ezfetch /usr/local/bin/

sudo mkdir /usr/local/share/ezfetch
sudo cp -r ./logos /usr/local/share/ezfetch


# Check if ~/.bashrc or ~/.zshrc exists and add to PATH
if [ -f "$HOME/.bashrc" ]; then
	echo 'export PATH="$PATH:/usr/local/bin"' >> "$HOME/.bashrc"
	echo 'export PATH="$PATH:/usr/local/share/ezfetch"' >> "$HOME/.bashrc"
	source $HOME/.bashrc
	echo "PATH updated in .bashrc"
fi

if [ -f "$HOME/.zshrc" ]; then
	echo 'export PATH="$PATH:/usr/local/bin"' >> "$HOME/.zshrc"
	echo 'export PATH="$PATH:/usr/local/share/ezfetch"' >> "$HOME/.zshrc"
	source $HOME/.zshrc
	echo "PATH updated in .zshrc"
fi

echo "Installation complete."

