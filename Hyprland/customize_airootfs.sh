#!/bin/bash
# SPDX-License-Identifier: GPL-3.0-or-later
#
# customize_airootfs.sh — Nyarch Hyprland airootfs customization
# Runs inside the ISO build environment after packages are installed.
#
# Note: Hyprland config files are already placed directly at
# /etc/skel/.config/hypr/ by steps.sh (cp -r etc/).

# Enable services
systemctl enable bluetooth
systemctl enable grub-btrfsd
systemctl enable haveged
systemctl enable cups
systemctl enable NetworkManager

# Copy Nyarch-Hyprland extras to skel (Ignis bar, Material theme)
SKEL_DIR="/etc/skel"
DOTFILES_DIR="/usr/share/nyarch/nyarch-hyprland-skel"

if [ -d "$DOTFILES_DIR" ]; then
    echo "Installing Nyarch-Hyprland extras..."

    # Copy Ignis bar/widget system
    cp -rv "$DOTFILES_DIR/ignis" "$SKEL_DIR/.config/ignis" 2>/dev/null || true

    # Install Material GTK theme
    mkdir -p /usr/share/themes
    cp -rv "$DOTFILES_DIR/Material" /usr/share/themes/ 2>/dev/null || true

    echo "Extras installed."
else
    echo "WARNING: Nyarch-Hyprland dotfiles not found at $DOTFILES_DIR"
fi

echo "Nyarch Hyprland customization complete."
