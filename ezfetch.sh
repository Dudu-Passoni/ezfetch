#!/bin/bash

#@Author: Luis Eduardo Contini Passoni

BLUE_LIGHT="\033[1;36m"
RESET="\033[37m"
RED="\033[1;31m"
ORANGE="\033[38;5;208m"
LIGHT_GREEN="\033[1;92m"
BLUE="\033[1;34m"
PURPLE="\033[1;35m"


logo_display() {
if [ -f /etc/os-release ]; then
	. /etc/os-release
fi

case $ID in

	arch)
echo -e "${BLUE_LIGHT}$(cat logos/arch.txt) ${RESET}"
COR=${BLUE_LIGHT}
PACOTES=$(pacman -Q | wc -l)

		;;
	debian)
echo -e "${RED}$(cat logos/debian.txt) ${RESET}"
COR=${RED}
PACOTES=$(dpkg -l | wc -l)
		;;
	ubuntu)
echo -e "${ORANGE}$(cat logos/ubuntu.txt) ${RESET}"
COR=${ORANGE}
PACOTES=$(dpkg -l | wc -l)
		;;
	mint)
echo -e "${LIGHT_GREEN}$(cat logos/mint.txt) ${RESET}"
COR=${LIGHT_GREEN}
PACOTES=$(dpkg -l | wc -l)
		;;
	fedora)
echo -e "${BLUE}$(cat logos/fedora.txt) ${RESET}"
COR=${BLUE}

if [[ $VERSION_ID == 22 || $VERSION_ID > 22 ]]; then
	PACOTES=$(dnf list installed | wc -l)
else
	PACOTES=$(yum list installed | wc -l)
fi
		;;
	rhel)
echo -e "${RED}$(cat logos/rhel.txt) ${RESET}"
COR=${RED}

if [[ $VERSION_ID == 8 || $VERSION_ID > 8 ]]; then
	PACOTES=$(dnf list installed | wc -l)
else
	PACOTES=$(yum list installed | wc -l)
fi
		;;
	centos)
echo -e "${PURPLE}$(cat logos/centos.txt) ${PURPLE}"
COR=${PURPLE}

if [[ $VERSION_ID == 8 || $VERSION_ID > 8 ]]; then
	PACOTES=$(dnf list installed | wc -l)
else
	PACOTES=$(yum list installed | wc -l)
fi
		;;
esac
}

KERNEL_VERSION=$(uname -r)
UPTIME=$(uptime -p)
USER_NAME=$(whoami)
HOSTNAME=$(hostname)
SHELL_NAME=$(basename $SHELL)

logo_display
echo "$USER_NAME@$HOSTNAME"
echo -e "${COR}----------${RESET}o${COR}-----------${RESET}"
echo "OS: $NAME"
echo "Kernel version: $KERNEL_VERSION"
echo "Packages: $PACOTES"
echo "Shell: $SHELL_NAME"
echo "Terminal: $TERM"
