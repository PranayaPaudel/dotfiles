#!/bin/bash
set -e

echo "Starting Dotfiles Backup..."

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 1. Backup GNOME Settings
echo "Taking snapshot of GNOME dconf settings..."
dconf dump /org/gnome/ > "$DOTFILES_DIR/gnome_settings.dconf"

# 2. Backup GNOME Extensions
echo "Backing up installed GNOME extensions..."
rm -rf "$DOTFILES_DIR/gnome_extensions"
mkdir -p "$DOTFILES_DIR/gnome_extensions"
if [ -d "$HOME/.local/share/gnome-shell/extensions" ]; then
    cp -r "$HOME/.local/share/gnome-shell/extensions/"* "$DOTFILES_DIR/gnome_extensions/" 2>/dev/null || true
fi

echo "Backup Complete! You can now run:"
echo "  git add ."
echo "  git commit -m \"Updated settings\""
echo "  git push"
