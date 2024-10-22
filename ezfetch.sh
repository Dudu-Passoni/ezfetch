#!/bin/bash

#@Author: Luis Eduardo Contini Passoni

# COLOR FOR THE LOGOS

BLUE_LIGHT="\033[1;36m"
RESET="\033[37m" #WHITE
RED="\033[1;31m"
ORANGE="\033[38;5;208m"
LIGHT_GREEN="\033[1;92m"
BLUE="\033[1;34m"
PURPLE="\033[1;35m"
GREEN="\033[32m"

#________________________________

if [ -f /etc/os-release ]; then
	. /etc/os-release
fi

#----------------------------------

if [ -z "$1" ]; then
  :
else
    ID="$1"
fi


case $ID in

	arch)
echo -e "${BLUE_LIGHT}$(cat logos/arch.txt) ${RESET}"
COR=${BLUE_LIGHT}
		;;
	debian)
echo -e "${RED}$(cat logos/debian.txt) ${RESET}"
COR=${RED}
		;;
	ubuntu)
echo -e "${ORANGE}$(cat logos/ubuntu.txt) ${RESET}"
COR=${ORANGE}
		;;
	mint)
echo -e "${LIGHT_GREEN}$(cat logos/mint.txt) ${RESET}"
COR=${LIGHT_GREEN}
		;;
	fedora)
echo -e "${BLUE}$(cat logos/fedora.txt) ${RESET}"
COR=${BLUE}
		;;
	rhel)
echo -e "${RED}$(cat logos/rhel.txt) ${RESET}"
COR=${RED}
		;;
	centos)
echo -e "${PURPLE}$(cat logos/centos.txt) ${RESET}"
COR=${PURPLE}
		;;
	gentoo)
echo -e "${PURPLE}$(cat logos/gentoo.txt) ${RESET}"
COR=${PURPLE}
		;;
	manjaro)
echo -e "${GREEN}$(cat logos/manjaro.txt) ${RESET}"
COR=${GREEN}
		;;
esac

MANAGER_NOFORM=$(command -v pacman dpkg-query yay yum dnf zypper kiss emerge cpm flatpak brew pkg)
MANAGER=$(basename "$MANAGER_NOFORM")

case $MANAGER in
	dpkg-query) PACOTES=$(dpkg -l | wc -l) ;;
	pacman) PACOTES=$(pacman -Q | wc -l) ;;
	yay) PACOTES=$(yay -Q | wc -l) ;;
	yum) PACOTES=$(yum list installed | wc -l) ;;
	dnf) PACOTES=$(dnf list installed | wc -l) ;;
	zypper) PACOTES=$(zypper se | wc -l) ;;
	kiss) PACOTES=$(kiss list | wc -l) ;;
	emerge) PACOTES="$(qlist -I | wc -l)" ;;
	cpm) PACOTES=$"$(cpm C)" ;;
esac
KERNEL_VERSION=$(uname -r)
UPTIME=$(uptime -p)
USER_NAME=$(whoami)
HOSTNAME=$(uname -n)
SHELL_NAME=$(basename $SHELL)

echo "$USER_NAME@$HOSTNAME"
echo -e "${COR}----------${RESET}o${COR}-----------${RESET}"
echo "OS: $NAME"
echo "Kernel version: $KERNEL_VERSION"
echo "Packages: $PACOTES"
echo "Shell: $SHELL_NAME"
echo "Terminal: $TERM"
