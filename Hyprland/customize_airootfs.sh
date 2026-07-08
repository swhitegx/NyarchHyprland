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

    # Ensure target directories exist before copying
    mkdir -p "$SKEL_DIR/.config"

    # Copy all config files
    cp -rv "$DOTFILES_DIR/.config"/* "$SKEL_DIR/.config/" 2>/dev/null || true
    cp -rv "$DOTFILES_DIR/ignis" "$SKEL_DIR/.config/ignis" 2>/dev/null || true

    # Install Material GTK theme
    mkdir -p /usr/share/themes
    cp -rv "$DOTFILES_DIR/Material" /usr/share/themes/ 2>/dev/null || true

    # Verify config was installed
    if [ -f "$SKEL_DIR/.config/hypr/hyprland.conf" ]; then
        echo "Verification: hyprland.conf installed successfully"
    else
        echo "WARNING: hyprland.conf was NOT installed! Check DOTFILES_DIR contents."
        ls -la "$DOTFILES_DIR/.config/hypr/" 2>/dev/null || true
    fi
else
    echo "WARNING: Nyarch-Hyprland dotfiles not found at $DOTFILES_DIR"
fi

echo "Nyarch Hyprland customization complete."
