#!/bin/bash
# SPDX-License-Identifier: GPL-3.0-or-later
#
# Install Flatpak applications for Nyarch Hyprland spin

# Install utility flatpaks
flatpak install -y flathub \
    org.gtk.Gtk3theme.adw-gtk3 \
    org.gtk.Gtk3theme.adw-gtk3-dark

echo "Nyarch Hyprland Flatpak installation complete."
