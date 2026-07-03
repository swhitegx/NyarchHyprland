#!/bin/bash
# SPDX-License-Identifier: GPL-3.0-or-later
#
# customize_airootfs.sh — Nyarch Hyprland airootfs customization
# Runs inside the ISO build environment after packages are installed.
#

# Enable services
systemctl enable bluetooth
systemctl enable grub-btrfsd
systemctl enable haveged
systemctl enable cups
systemctl enable NetworkManager

# Copy Nyarch-Hyprland dotfiles to skel
SKEL_DIR="/etc/skel"
DOTFILES_DIR="/usr/share/nyarch/nyarch-hyprland-skel"

if [ -d "$DOTFILES_DIR" ]; then
    echo "Installing Nyarch-Hyprland dotfiles..."
    cp -r --no-preserve=mode,ownership "$DOTFILES_DIR/.config"/* "$SKEL_DIR/.config/" 2>/dev/null || true
    cp -r --no-preserve=mode,ownership "$DOTFILES_DIR/ignis" "$SKEL_DIR/.config/ignis" 2>/dev/null || true
    mkdir -p /usr/share/themes
    cp -r --no-preserve=mode,ownership "$DOTFILES_DIR/Material" /usr/share/themes/ 2>/dev/null || true
    echo "Dotfiles installed."
else
    echo "WARNING: Nyarch-Hyprland dotfiles not found. Minimal skel will be used."
fi

echo "Nyarch Hyprland customization complete."
