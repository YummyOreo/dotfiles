#!/bin/bash

read -n1 -rep $'[\e[1;33mACTION\e[0m] - Would you like to continue with the install. WARNING do not run this on a system that has something already installed. (y,n) ' INST
if [[ $INST == "Y" || $INST == "y" ]]; then
    echo -e "$COK - Starting install script.."
else
    echo -e "$CNT - This script would now exit, no changes were made to your system."
    exit
fi

ISYAY=/sbin/yay
if [ -f "$ISYAY" ]; then
    echo -e "$COK - yay was located, moving on."
else
    echo -e "$CWR - Yay was NOT located"
    read -n1 -rep $'[\e[1;33mACTION\e[0m] - Would you like to install yay (y,n) ' INSTYAY
    if [[ $INSTYAY == "Y" || $INSTYAY == "y" ]]; then
        git clone https://aur.archlinux.org/yay-git.git &>> $INSTLOG
        cd yay-git
        makepkg -si --noconfirm &>> ../$INSTLOG
        cd ..

    else
        echo -e "$CER - Yay is required for this script, now exiting"
        exit
    fi
fi

### Disable wifi powersave mode ###
read -n1 -rep $'[\e[1;33mACTION\e[0m] - Would you like to disable WiFi powersave? (y,n) ' WIFI
if [[ $WIFI == "Y" || $WIFI == "y" ]]; then
    LOC="/etc/NetworkManager/conf.d/wifi-powersave.conf"
    echo -e "$CNT - The following file has been created $LOC."
    echo -e "[connection]\nwifi.powersave = 2" | sudo tee -a $LOC &>> $INSTLOG
    echo -e "\n"
    echo -e "$CNT - Restarting NetworkManager service..."
    sleep 1
    sudo systemctl restart NetworkManager &>> $INSTLOG
    sleep 3
fi

## install
echo -e "$COK - Updating yay database..."
yay -Suy --noconfirm &>> $INSTLOG

for PKG in hyprland-bin waybar-hyprland swaybg swaylock-effects wofi wlogout mako thunar noto-fonts-emoji polkit-gnome python-requests starship swappy grim slurp pamixer brightnessctl gvfs bluez bluez-utils lxappearance xfce4-settings dracula-gtk-theme dracula-icons-git xdg-desktop-portal-hyprland-git blueman networkmanager
do
    if yay -Qs $PKG > /dev/null ; then
        echo -e "$PKG is already installed."
    else
        echo -e "$PKG - Now installing $PKG ..."
        yay -S --noconfirm $SOFTWR &>> $INSTLOG
        if yay -Qs $PKG > /dev/null ; then
            echo "$PKG was installed."
        else
            echo -e "$PKG - $PKG install had failed, please check the install.log"
            exit
        fi
    fi
done

# Install other
for PKG in neofetch neovim nodejs npm starship xdg-desktop-portal qimgv-git glow github-cli vhs git-delta unzip zip lazygit discord fzf base-devel google-chrome-stable xclip jdk-openjdk jre-openjdk
do
    if yay -Qs $PKG > /dev/null ; then
        echo -e "$PKG is already installed."
    else
        echo -e "$PKG - Now installing $PKG ..."
        yay -S --noconfirm $SOFTWR &>> $INSTLOG
        if yay -Qs $PKG > /dev/null ; then
            echo "$PKG was installed."
        else
            echo -e "$PKG - $PKG install had failed, please check the install.log"
            exit
        fi
    fi
done

# Start the bluetooth service
echo -e "$CNT - Starting the Bluetooth Service..."
sudo systemctl enable --now bluetooth.service &>> $INSTLOG
sleep 2

# Clean out other portals
echo -e "$CNT - Cleaning out conflicting xdg portals..."
yay -R --noconfirm xdg-desktop-portal-gnome xdg-desktop-portal-gtk &>> $INSTLOG

# Install cargo
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

for PKG in porsmo cargo-info cargo-insta cargo-binstall sccache irust alacritty bat bottom coreutils exa ripgrep the-way zoxide just
do
        echo -e "$PKG - Now installing $PKG ..."
        yay -S --noconfirm $SOFTWR &>> $INSTLOG
        if cargo install $PKG > /dev/null ; then
            echo "$PKG was installed."
        else
            echo -e "$PKG - $PKG install had failed, please check the install.log"
            exit
        fi
done

# install nu
git clone https://github.com/nushell/nushell
cd nushell
cargo install --path .
cd ..

echo "Copying config files"
mkdir ~/.config/
cp ./.config/nushell/ ~/.config/
cp ./.config/starship.toml ~/.config/
cp ./.config/hypr/ ~/.config/
cp ./.config/mako/ ~/.config/
cp ./.config/nvim/ ~/.config/
cp ./.config/wofi/ ~/.config/
cp ./.config/waybar/ ~/.config/
cp ./.config/gtk-3.0/ ~/.config/
cp ./.config/systemd/ ~/.config/
cp ./.config/swaylock/ ~/.config/
cp ./.config/alacritty/ ~/.config/

mkdir ~/.ssh/
mkdir ~/.cache/starship/
cp ./.cargo/ ~/
cp ./.cache/init.nu ~/.cache/starship/
cp ./.ssh/ ~/
cp ./.themes/ ~/
mkdir /usr/local/share/fonts/
cp ./DinaRemaster NF.ttc /usr/local/share/fonts/

echo "Please install brew, then restart system, then install neocowsay"
sleep 10s
echo -e "$CNT - Script had completed!"
read -n1 -rep $'[\e[1;33mACTION\e[0m] - Would you like to start Hyprland now? (y,n) ' HYP
if [[ $HYP == "Y" || $HYP == "y" ]]; then
    Hyprland
else
    exit
fi
