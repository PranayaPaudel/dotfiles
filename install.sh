#!/bin/bash
set -e

echo "Starting Dotfiles Installation..."

# 1. Install System Packages
echo "Installing APT packages..."
sudo apt update
sudo apt install -y kitty sassc gnome-shell-extension-manager papirus-icon-theme gnome-shell-extensions curl git conky-all

# 2. Install Starship & Fastfetch
echo "Installing Starship..."
curl -sS https://starship.rs/install.sh | sh -s -- -y

echo "Installing Fastfetch..."
sudo add-apt-repository -y ppa:zhangsongcui3371/fastfetch
sudo apt update
sudo apt install -y fastfetch

echo "Installing UbuntuMono Nerd Font..."
mkdir -p ~/.local/share/fonts
curl -fLo ~/.local/share/fonts/UbuntuMono.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/UbuntuMono.zip
unzip -o ~/.local/share/fonts/UbuntuMono.zip -d ~/.local/share/fonts/UbuntuMono
fc-cache -fv
rm ~/.local/share/fonts/UbuntuMono.zip

# 3. Create Symlinks
echo "Creating Symlinks..."
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

mkdir -p ~/.config/conky
# We use -sfn to force replace if it's already a symlink or directory
ln -sfn "$DOTFILES_DIR/kitty" ~/.config/kitty
ln -sf "$DOTFILES_DIR/starship.toml" ~/.config/starship.toml
ln -sf "$DOTFILES_DIR/conky/conky.conf" ~/.config/conky/conky.conf
mkdir -p ~/.config/autostart
ln -sf "$DOTFILES_DIR/conky/conky.desktop" ~/.config/autostart/conky.desktop

# Backup original bashrc if it's not a symlink
if [ ! -L ~/.bashrc ]; then
    mv ~/.bashrc ~/.bashrc.backup
fi
ln -sf "$DOTFILES_DIR/bashrc" ~/.bashrc

# 4. Install Colloid Theme
echo "Installing Colloid Theme..."
if [ ! -d "/tmp/Colloid-gtk-theme" ]; then
    git clone https://github.com/vinceliuice/Colloid-gtk-theme.git /tmp/Colloid-gtk-theme
fi
cd /tmp/Colloid-gtk-theme
./install.sh -c dark -s compact --tweaks catppuccin
cd "$DOTFILES_DIR"
rm -rf /tmp/Colloid-gtk-theme

# 5. Restore GNOME Settings (Extensions & UI State)
echo "Restoring GNOME Extensions..."
if [ -d "$DOTFILES_DIR/gnome_extensions" ]; then
    mkdir -p ~/.local/share/gnome-shell/extensions
    cp -r "$DOTFILES_DIR/gnome_extensions/"* ~/.local/share/gnome-shell/extensions/
fi

echo "Restoring GNOME dconf settings..."
if [ -f "$DOTFILES_DIR/gnome_settings.dconf" ]; then
    dconf load /org/gnome/ < "$DOTFILES_DIR/gnome_settings.dconf"
else
    echo "Warning: gnome_settings.dconf not found. Skipping GNOME restore."
fi

echo "Installation Complete! Please reboot or log out to apply all GNOME extensions safely."
