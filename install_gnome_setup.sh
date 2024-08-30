#!/bin/bash

# Update and install essential packages
sudo apt-get update
sudo apt-get install -y curl rsync gdebi nautilus-admin nautilus-extension-gnome-terminal sassc gnome-tweaks gnome-shell-extension-manager gnome-themes-extra conky-all jq playerctl cava neofetch gnome-weather gnome-maps gnome-sound-recorder gnome-calendar gnome-clocks gnome-connections gnome-console gnome-contacts gnome-music gnome-shell-extension-pomodoro plymouth ostree appstream-util flatpak adwaita-icon-theme-full

# Clone and install Orchis theme
cd ~/Programs/
git clone git@github.com:vinceliuice/Orchis-theme.git
cd Orchis-theme/
./install.sh -c dark -t grey -l

# Set flatpak overrides
flatpak override --filesystem=xdg-config/gtk-4.0
sudo flatpak override --filesystem=xdg-config/gtk-4.0

# Install Stylepak
cd ..
git clone git@github.com:refi64/stylepak.git
cd stylepak/
./stylepak override --filesystem=xdg-config/gtk-4.0
./stylepak install-user

# Additional theme and icon setup
mkdir ~/.themes
unzip ~/Programs/GTK-Themes.zip -d ~/.themes/
ln -sf ~/.themes/Orchis-Dark/gtk-4.0/{assets,gtk.css,gtk-dark.css} ~/.config/gtk-4.0/

mkdir -p $HOME/.local/share/icons
unzip ~/Programs/icon-themes.zip -d $HOME/.local/share/icons/

mkdir -p $HOME/.icons
unzip -o $HOME/Programs/cursors-theme.zip -d $HOME/.icons/
unzip -o $HOME/Programs/fonts.zip -d $HOME/.local/share/
sudo unzip -o $HOME/Programs/wallpapers.zip -d /usr/share/backgrounds/

# Configure Conky, Cava, and Neofetch
unzip -o $HOME/Programs/conky-config.zip -d $HOME/.config/
unzip -o $HOME/Programs/cava-config.zip -d $HOME/.config/
unzip -o $HOME/Programs/neofetch-config.zip -d $HOME/.config/

# Flatpak setup
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install -y flathub io.bassi.Amberol
flatpak install -y flathub net.agalwood.Motrix
flatpak install -y flathub com.rafaelmardojai.Blanket
flatpak install -y flathub com.github.KRTirtho.Spotube
flatpak install -y flathub com.mattjakeman.ExtensionManager

# Apply flatpak overrides
sudo flatpak override --filesystem=$HOME/.themes
sudo flatpak override --filesystem=$HOME/.local/share/icons

# Install and configure Plymouth theme
sudo unzip -o $HOME/Programs/plymouth-theme.zip -d /usr/share/plymouth/themes/
sudo update-alternatives --install /usr/share/plymouth/themes/default.plymouth default.plymouth /usr/share/plymouth/themes/hexagon_dots/hexagon_dots.plymouth 100
sudo update-alternatives --config default.plymouth
sudo update-initramfs -u

# Load GNOME desktop settings
unzip -o $HOME/Programs/ubuntu-desktop-settings.zip -d $HOME/Programs/
dconf load / < $HOME/Programs/ubuntu-desktop-settings.conf

# Load GNOME extensions
unzip -o $HOME/Programs/gnome-extensions.zip -d $HOME/.local/share/gnome-shell/
dconf load / < $HOME/Programs/ubuntu-desktop-settings.conf

