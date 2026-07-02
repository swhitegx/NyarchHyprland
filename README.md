# NyarchHyprland

Nyarch Linux Hyprland configuration — the Hyprland spin of [Nyarch Linux](https://nyarchlinux.moe).

## About

This repository contains the ISO build infrastructure for the **Hyprland** desktop spin of Nyarch Linux.
It follows the same structure as the [GNOME spin](https://github.com/NyarchLinux/NyarchLinux/tree/main/Gnome) but adapted for Hyprland.

### Structure

```
NyarchHyprland/
├── Hyprland/               ← ISO build root
│   ├── steps.sh            ← Main build script (run as root)
│   ├── profiledef.sh       ← ISO metadata
│   ├── packages.x86_64     ← Package list
│   ├── pacman.conf         ← Pacman config
│   ├── customize_airootfs.sh ← Post-install script
│   ├── BUILDING.md         ← Build instructions
│   ├── CHANGES.md          ← Change log
│   ├── CREDITS.md          ← Credits
│   ├── grub/               ← GRUB bootloader config
│   ├── efiboot/            ← EFI boot entries
│   ├── syslinux/           ← Syslinux config
│   ├── etc/                ← System config (airootfs)
│   │   ├── calamares/      ← Calamares installer config
│   │   ├── skel/           ← Dotfiles (Hyprland, Waybar, etc.)
│   │   └── ...
│   └── usr/                ← User scripts and assets
├── README.md               ← This file
└── LICENSE                 ← GPL-3.0
```

### Building

See [Hyprland/BUILDING.md](Hyprland/BUILDING.md) for build instructions.

### Contributing

We welcome contributions! Please join our [Discord server](https://discord.gg/xuw6BNXXE7) and check the [CONTRIBUTING.md](https://github.com/NyarchLinux/NyarchLinux/blob/main/CONTRIBUTING.md) guidelines of the main repository.

### Dotfiles

The Hyprland spin is inspired by [end-4/dots-hyprland](https://github.com/end-4/dots-hyprland). The dotfiles under `Hyprland/etc/skel/.config/` are the starting point — feel free to customize and contribute better configurations!

### Planned features
- [x] ISO build infrastructure
- [x] Hyprland, Waybar, Wofi, Dunst config stubs
- [x] SDDM display manager
- [x] Calamares installer integration
- [ ] Complete dotfiles (end-4 fork integration)
- [ ] Custom Plymouth theme
- [ ] Wallpaper pack
- [ ] Nyarch apps integration (Nyarch Tour, Assistant, etc.)
- [ ] Flatpak integration
