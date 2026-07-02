#!/bin/bash
# SPDX-License-Identifier: GPL-3.0-or-later

# This script runs inside the airootfs after all packages are installed
# Customize the ISO root filesystem here

# Enable services
systemctl enable bluetooth
systemctl enable grub-btrfsd
systemctl enable sddm
systemctl enable haveged
systemctl enable cups

# Install Flatpak themes
flatpak mask "org.freedesktop.Platform.GL.nvidia*"
flatpak install -y org.gtk.Gtk3theme.adw-gtk3 org.gtk.Gtk3theme.adw-gtk3-dark
flatpak --remove mask "org.freedesktop.Platform.GL.nvidia*"

# Apply Nyarch Copy (branding and extras)
# wget https://nyarchlinux.moe/NyarchCopy.tar.gz && tar -xvf NyarchCopy.tar.gz && cd NyarchCopy && bash ./apply_airoot.sh && rm -rf NyarchCopy*
# rm -rf /NyarchCopy.tar.gz
# rm -rf /NyarchCopy

echo "Nyarch Hyprland airootfs customization complete."
