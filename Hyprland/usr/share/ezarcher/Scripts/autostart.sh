#!/bin/bash
# Nyarch Hyprland — first boot setup script
# Applies full dotfiles from Nyarch-Hyprland, then launches Calamares

LIVEUSER="live"
DOTFILES_SRC="/usr/share/nyarch/nyarch-hyprland-skel"
CONFIG_DST="$HOME/.config"

if [ "$USER" != "$LIVEUSER" ]; then
    # Not live user — remove autostart and exit
    rm -f "$HOME/.config/autostart/start.desktop" 2>/dev/null
    exit 0
fi

echo "Nyarch Hyprland: applying dotfiles..."

# Apply Nyarch-Hyprland dotfiles on top of the minimal config
if [ -d "$DOTFILES_SRC" ]; then
    # Copy .config (kitty, fish, neofetch, and our hyprland.conf)
    # Our existing hyprland.conf stays (it's the working minimal config)
    for dir in kitty fish neofetch; do
        if [ -d "$DOTFILES_SRC/.config/$dir" ]; then
            cp -r "$DOTFILES_SRC/.config/$dir" "$CONFIG_DST/" 2>/dev/null || true
        fi
    done

    # Copy and fix kitty colors (from Ignis material cache if available)
    if [ -f "$HOME/.cache/ignis/material/dark_colors-kitty.conf" ]; then
        echo "include $HOME/.cache/ignis/material/dark_colors-kitty.conf" >> "$CONFIG_DST/kitty/kitty.conf"
    fi

    # Copy Ignis if available (may not be installed in China)
    if [ -d "$DOTFILES_SRC/ignis" ] && [ -d "$CONFIG_DST/ignis" ]; then
        cp -r "$DOTFILES_SRC/ignis" "$CONFIG_DST/" 2>/dev/null || true
    fi

    # Apply Material GTK theme
    mkdir -p "$HOME/.local/share/themes"
    if [ -d "$DOTFILES_SRC/Material" ]; then
        cp -r "$DOTFILES_SRC/Material" "$HOME/.local/share/themes/" 2>/dev/null || true
    fi

    # Set GTK theme via gsettings (may fail on Hyprland, that's OK)
    gsettings set org.gnome.desktop.interface gtk-theme "Material" 2>/dev/null || true
    gsettings set org.gnome.desktop.interface icon-theme "Papirus" 2>/dev/null || true

    echo "Dotfiles applied."
else
    echo "WARNING: Nyarch-Hyprland skel not found at $DOTFILES_SRC"
fi

# Set up wallpaper via hyprctl (runs after Hyprland is ready)
sleep 2
if [ -f "$HOME/.config/wallpaper.png" ] && command -v hyprctl &>/dev/null; then
    hyprctl hyprpaper wallpaper ",$HOME/.config/wallpaper.png" 2>/dev/null || true
fi

# Launch Calamares installer
sleep 1
sudo calamares
