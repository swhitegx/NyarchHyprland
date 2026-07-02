# Building

## Prerequisites and development environment
- First of all, to build this distribution you need an Arch Linux installation, or a derivative that ships archiso. We strongly suggest you to use [Ezarcher](https://sourceforge.net/projects/ezarch/).
- You have to install Chaotic-AUR packages. You can do this by just running the `install_chaotic.sh` file
- It is strongly suggested to run a full system update before building
```bash
sudo pacman -Syu
```
- You need to install `archiso` package
```bash
sudo pacman -S archiso
```

## Running the script
- To build the ISO just run
```bash
sudo ./steps.sh
```
And you will find the ISO in `./out`

## Editing installed packages
### Packages from official repositories
- Every package in `packages.x86_64` will be installed
- Also take a look at `./etc` directory for configuration files

### Adding custom packages
We now use [Nyarch Repo](https://github.com/NyarchLinux/nyarch-repo) for custom packages.

## Editing default desktop configuration
Any file in `./etc/skel/` will be put in user's home. There you can store dotfiles related to Hyprland configuration:
- `etc/skel/.config/hypr/` — Hyprland compositor config
- `etc/skel/.config/waybar/` — Wayland status bar
- `etc/skel/.config/wofi/` — Application launcher
- `etc/skel/.config/dunst/` — Notification daemon
- `etc/skel/.config/kitty/` — Terminal emulator

## Running commands in the airootfs
You can run commands in the airootfs before the ISO is built by editing the `customize_airootfs.sh` file.

## Notes
This Hyprland spin is based on the GNOME spin's build infrastructure. 
For more details, refer to the [NyarchLinux main repository](https://github.com/NyarchLinux/NyarchLinux).
