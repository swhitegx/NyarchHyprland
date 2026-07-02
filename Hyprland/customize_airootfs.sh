#!/bin/bash
# SPDX-License-Identifier: GPL-3.0-or-later
#
# customize_airootfs.sh — Nyarch Hyprland airootfs customization
# Runs inside the ISO build environment after packages are installed.
#

set -e

echo "=== Nyarch Hyprland airootfs customization ==="

# --- Enable critical services ---
systemctl enable bluetooth
systemctl enable grub-btrfsd
systemctl enable sddm
systemctl enable haveged
systemctl enable cups
systemctl enable NetworkManager

# --- Copy dotfiles to skel ---
# Nyarch-Hyprland dotfiles are shipped as a tarball / submodule
# and used as the default skel for new users
SKEL_DIR="/etc/skel"
DOTFILES_DIR="/usr/share/nyarch/nyarch-hyprland-skel"

if [ -d "$DOTFILES_DIR" ]; then
    echo "Installing Nyarch-Hyprland dotfiles..."
    
    # Copy .config (hypr, kitty, fish, neofetch)
    cp -r --no-preserve=mode,ownership "$DOTFILES_DIR/.config"/* "$SKEL_DIR/.config/" 2>/dev/null || true
    
    # Copy Ignis bar/widget system
    cp -r --no-preserve=mode,ownership "$DOTFILES_DIR/ignis" "$SKEL_DIR/.config/ignis" 2>/dev/null || true
    
    # Copy Material theme
    mkdir -p /usr/share/themes
    cp -r --no-preserve=mode,ownership "$DOTFILES_DIR/Material" /usr/share/themes/ 2>/dev/null || true
    
    echo "Dotfiles installed."
else
    echo "WARNING: Nyarch-Hyprland dotfiles not found at $DOTFILES_DIR"
    echo "The ISO will ship with minimal skel. Install dotfiles manually."
fi

# --- Install Flatpak themes ---
flatpak mask "org.freedesktop.Platform.GL.nvidia*" 2>/dev/null || true
flatpak install -y --noninteractive org.gtk.Gtk3theme.adw-gtk3 org.gtk.Gtk3theme.adw-gtk3-dark 2>/dev/null || true
flatpak --remove mask "org.freedesktop.Platform.GL.nvidia*" 2>/dev/null || true

# --- Set default shell to fish ---
chsh -s /usr/bin/fish 2>/dev/null || true

echo "=== Nyarch Hyprland customization complete ==="
