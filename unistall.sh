#!/bin/bash

# Define o arquivo de configuração
BASHRC="$HOME/.bashrc"
ZSHRC="$HOME/.zshrc"

# Linha a ser removida
LINE_TO_REMOVE1='export PATH="$PATH:/usr/local/bin"'
LINE_TO_REMOVE2='export PATH="$PATH:/usr/local/share/ezfetch"'

# Remove a linha do .bashrc, se existir
if [ -f "$BASHRC" ]; then
	sed -i "\|$LINE_TO_REMOVE1|d" "$BASHRC"
	sed -i "\|$LINE_TO_REMOVE2|d" "$BASHRC"
	source ~/.bashrc
	echo "Linha removida de $BASHRC"
fi

# Remove a linha do .zshrc, se existir
if [ -f "$ZSHRC" ]; then
	sed -i "\|$LINE_TO_REMOVE1|d" "$ZSHRC"
	sed -i "\|$LINE_TO_REMOVE2|d" "$ZSHRC"
	source ~/.zshrc
	echo "Linha removida de $ZSHRC"
fi
sudo rm /usr/local/bin/ezfetch
sudo rm -Rf /usr/local/share/ezfetch


echo "Desinstalação completa. Para que as alterações tenham efeito, reinicie seu terminal ou execute 'source ~/.bashrc' ou 'source ~/.zshrc'."

