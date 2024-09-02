#!/bin/bash

# Update and install essential packages
sudo apt-get update
sudo apt-get install -y curl rsync gdebi nautilus-admin nautilus-extension-gnome-terminal sassc gnome-tweaks gnome-shell-extension-manager gnome-themes-extra conky-all jq playerctl cava neofetch gnome-weather gnome-maps gnome-sound-recorder gnome-calendar gnome-clocks gnome-connections gnome-console gnome-contacts gnome-music plymouth ostree appstream-util flatpak adwaita-icon-theme-full


# Additional theme and icon setup
mkdir ~/.themes
unzip GTK-Themes.zip -d ~/.themes/
ln -sf ~/.themes/Orchis-Dark/gtk-4.0/{assets,gtk.css,gtk-dark.css} ~/.config/gtk-4.0/

mkdir -p $HOME/.local/share/icons
unzip icon-themes.zip -d $HOME/.local/share/icons/

mkdir -p $HOME/.icons
unzip -o cursors-theme.zip -d $HOME/.icons/
unzip -o fonts.zip -d $HOME/.local/share/
sudo unzip -o wallpapers.zip -d /usr/share/backgrounds/

# Configure Conky, Cava, and Neofetch
unzip -o conky-config.zip -d $HOME/.config/
unzip -o cava-config.zip -d $HOME/.config/
unzip -o neofetch-config.zip -d $HOME/.config/

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
sudo unzip -o plymouth-theme.zip -d /usr/share/plymouth/themes/
sudo update-alternatives --install /usr/share/plymouth/themes/default.plymouth default.plymouth /usr/share/plymouth/themes/hexagon_dots/hexagon_dots.plymouth 100
sudo update-alternatives --config default.plymouth
sudo update-initramfs -u

# Load GNOME desktop settings
dconf load / < ubuntu-desktop-settings.conf

# Load GNOME extensions
unzip -o gnome-extensions.zip -d $HOME/.local/share/gnome-shell/
dconf load / < ubuntu-desktop-settings.conf

