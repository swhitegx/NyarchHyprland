# Nyarch Hyprland — auto-start Hyprland on TTY1 (live ISO)
# Only start Hyprland on the first virtual terminal (tty1)
# to avoid launching multiple instances

if [ "$(tty)" = "/dev/tty1" ] && [ -z "$HYPRLAND_INSTANCE_SIGNATURE" ]; then
    sleep 1
    if command -v start-hyprland &>/dev/null; then
        exec start-hyprland
    else
        exec Hyprland
    fi
fi
