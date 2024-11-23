#!/bin/bash

# ==========================  ===============================
# Arch setup full configuration script
# Author: AreiaTheNight
# Date: ?????? 
#
# This script updates the system and allows you to install
# or configure an AUR helper (paru or yay). Designed for
# Arch Linux systems and create a functional setup for old
# hardware or related. 
#
# WARNING!
# - Use this script at your own risk.
# - Make sure to understand the commands before running them.
# - This script requires administrator privileges.
# - The only source of this scripts is on http://github.com/AreaTeNight
#
# LICENSE:
# This script is released under the Creative Commons 
# Universal Public Domain Dedication (CC0 1.0). You are 
# free to copy, modify, redistribute, and use this code 
# without restrictions. More info:
# https://creativecommons.org/publicdomain/zero/1.0/
# Just add me in the credis 
# ==========================  ===============================

# Colores
green="\e[0;32m\033[1m"
nocolor="\033[0m\e[0m"
red="\e[0;31m\033[1m"
blue="\e[0;34m\033[1m"
yell="\e[0;33m\033[1m"
purple="\e[0;35m\033[1m"
turquoise="\e[0;36m\033[1m"
gray="\e[0;37m\033[1m"

cat << "EOF"
%%%%%%%%%%%%%%%%%%%%%%%%%%%% %%                                             %%%%%%%%%%%%%%%%%%%%%%%%
#####%%%%%%%%%%%%%%%%%%%%%%%%%%%                *         %                %%%%%%%%%%%%%%%%%########
###%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                 %      %                  %%%%%%%%%%%%%############
####%%%%%%%%%%%%%%%%%%%%%%%%%%%%%               #%     *%                  %%%%######%%%%%%#########
####%%###%%%%%%#####%#%%%%%%%%%%*           #%%%%  *### #%%%              %%%%%###########+#%%%#####
#################%%%%%%######%%#%           +#%%%%%%%%%%##%%%%            %%%%%###+###########%%%###
#############%%%%#############%#%*          +**#%%%%%%%%%%%%%%           %%%#############*#######%%%
###########%%####################%             **#%+++*%%%#             #%%####%##*##*##############
########%%#######################%%            ***%%++%#%*%#           ##%#####%##**##-#############
######%%##################**#****#%#    +*    :%%=+++++*%%%#*         ##%##*#####****=*#############
####%#########***-*##**#**********#%* =+*##** %%%#-+%**#%%%   %%    *###*****+=*+***=+***###########
##%##############**********#***+++###*=  +*%%%%%%#+-=*#% * #%%%%  +###***********#**#*+*#####       
%####          *##********+***+++++*##*   %--%=+*=++#%%% ###%%%%%###***********+*#**-**####         
##               ***+******#+++++++++***  ####%#*%%%%%%%%%%%%%#%%%%++++*****+*+***=+**####          
                    +=+**-***+=+++++===+*#*##..:+##=##%%%%%%%##%%%%+++++++++++:=+*==*###   % %%%%   
                    +*+**+**++++=-::-:::**=+*#%*%+****#%%%%%%%%%###%%#*+++++=-=#=:.####         %#  
                    ++++=***+++++===-:.**%##%%##%%%%%%%%%%%%%%%%%%%%%%%+++++=#==#=####              
                    +=-+=-#*+++++++-=+*+%%%%%%%%%%%%%%%%%%%%%%%%%%%========#*+###*###               
                    **-*:++*+++++++=   =#%##%%%%%%%%%#######=+%%%##%=*##*%%%%%**##%#                
                       *###**######=:###%##+#%%%%%%%##%####--=*#%%%#%###%%%#***#*%%                 
                           #%%%%###%%%%%#*+=#%%%%%%%#%####:::-= #%%%%%%%%       #%%                 
                                #%%%%%##   +#%%%%%%%%%%%%        %%%%%%          %                  
                                    * ##    *%%%%%%%%%%#%        #               %                  
                                      +    ++#%%%%%%%%#%%% %%%                                      
                                       %% *##%%%%%%%%%%#%#%%%%                                      
  *###***###***+                       #%##%%#%%%%%%%%%%%%%%%%                                      
###*#     ######*####                  ###%%%%%%%%%%%%%%%%%%%%#                                     
                 ####**##            * ####%%%%%%%%%%%%%%%%%%%%                                     
                     ###****         +*#%%%%%%%%%%%%%%%%%%%%%%%%                                    
               #%%%%%   ***+**     --##%#%%%%%%%%%%%%%%%%%%%%%%%%                                   
                          (         (                  )  (                )         
                   (      )\ )      )\ )    (       ( /(  )\ )  (       ( /(   *   ) 
                   )\    (()/( (   (()/(    )\      )\())(()/(  )\ )    )\())` )  /( 
                ((((_)(   /(_)))\   /(_))((((_)(   ((_)\  /(_))(()/(   ((_)\  ( )(_))
                 )\ _ )\ (_)) ((_) (_))   )\ _ )\   _((_)(_))   /(_))_  _((_)(_(_()) 
                 (_)_\(_)| _ \| __||_ _|  (_)_\(_) | \| ||_ _| (_)) __|| || ||_   _| 
                  / _ \  |   /| _|  | |    / _ \   | .` | | |    | (_ || __ |  | |   
                 /_/ \_\ |_|_\|___||___|  /_/ \_\  |_|\_||___|    \___||_||_|  |_|                             
EOF

#Ctrl C función para salir
function ctrl_c(){
    echo -e "\n[!] Bye!\n"
    tput cnorm
    exit 1
}

# Capturar Ctrl+C
trap ctrl_c SIGINT


# Actualización del sistema
echo -e "${red}\n\n[!] Updating system, please wait... This will take a while, so why not go for a snack or pet your pets?${nocolor}"
sudo pacman -Syu --noconfirm

echo -e "${blue}\n\n[!]Verifying yay.."

# Instalación de yay
if ! command -v yay > /dev/null 2>&1; then
    echo -e "${green}Installing yay${nocolor}"
    # Instalacion de yay
    echo -e "${green}[!] Installing yay${nocolor}"
    sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si 
    yay -Y --gendb
fi

# Configurando la pantaia 
yay -S xorg-xrandr --noconfirm
xrandr --output Virtual1 --mode 1920x1080

## Descomentar si se necesita 
#yay -S open-vm-tools
#vmware-user

cpath=$(pwd)

echo -e "\n\n${purple}Starting the basic setup,${nocolor} ${red}let's go!${nocolor}"

cat << "EOF"                             
╔═╗┌─┐┌─┐┌┬┐┬ ┬┌─┐┌┬┐┬┌─┐┌─┐
╠═╣├┤ └─┐ │ ├─┤├┤  │ ││  └─┐
╩ ╩└─┘└─┘ ┴ ┴ ┴└─┘ ┴ ┴└─┘└─┘
EOF

echo -e "\n${purple}[!]Installing sway!"

# Instalando paquetes necesarios
yay -S sway waybar rofi swaylock swayidle feh mako kitty zsh

#Instalando fuentes
yay -S ttf-nerd-fonts-symbols-mono

# Instalación de Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
chsh -s $(which zsh)
yay -S zsh-syntax-highlighting zsh-autosuggestions
cp .p10k.zsh ~/
echo .p10k.zsh > ~/.p10k.zsh 
echo "source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
echo "source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc

# Root Powerlevel10k
cd /root
sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /root
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
chsh -s $(which zsh)
yay -S zsh-syntax-highlighting zsh-autosuggestions
cp .p10k.zsh ~/
echo .p10k.zsh > ~/.p10k.zsh 
echo "source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
echo "source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc

cd $cpath

## Copia de las configuraciones

cd ~/.config
cp $cpath/sway .
cp $cpath/kitty .

