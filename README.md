# NixOS Configuration Flake
Personal NixOS configuration made for desktop and laptop using flakes and home-manager.

## Hosts specs
#### Desktop:
- Main monitor (144hz), second monitor (Vertical)
- NVIDIA Graphics Card (RTX 2070)
- French keyboard (AZERTY layout)
#### Laptop:
- Thinkpad T470
- French keyboard (AZERTY layout)

## Installation
Install [NixOS](https://nixos.org/download/) without desktop environment.

Temporarily install git via nix-shell:
```sh
nix-shell -p git
```

Clone the repo:
```sh
git clone https://github.com/Backendt/NixOS-Config.git ~/.dotfiles
```
> Note: If you change the configuration path (`~/.dotfiles` by default), you will need to update its value in the [bash user module](./modules/user/bash.nix) and in the following commands.

Install [standalone Home Manager on a Nix Flake](https://nix-community.github.io/home-manager/index.xhtml#sec-flakes-standalone):
(The command may change in the future)
```sh
nix --experimental-features "nix-command flakes" run home-manager/release-24.05 -- switch --flake ~/.dotfiles -b old
```

Build the system:
```sh
sudo nixos-rebuild switch --flake ~/.dotfiles
```
> If your hostname isn't `nixos-desktop` or `nixos-laptop`, choose the configuration by setting the flake path as `~/.dotfiles#nixos-desktop` or `~/.dotfiles#nixos-laptop` when building the system.

Reboot and enjoy !

## Changing the built preset
You can change the built environment by editing the `current-preset` value in [flake.nix](./flake.nix#L17).

The value should be the name of a preset directory. It can be found in the [preset directory](./presets/).
> The "bundles" directory isn't a preset. It contains module bundles that are imported from presets.

## Architecture

### Flake ([flake.nix](./flake.nix))
The flake imports a preset based on the `current-preset` value, and defines if the current host should use the `desktop` or `laptop` branch based on the current hostname.

### Presets
Presets imports modules and module bundles to build a complete environment.
The configuration is split in two:
- The system part, used by Nix, with its main file called `system-configuration.nix` (Usually named `configuration.nix` on other configs)
- The user part, used by Home Manager, with its main file called `home-configuration` (Usually named `home.nix` on other configs)

### Bundles
A bundle is a pack of multiple modules that can be imported from presets.

### Modules
A module installs and configure a package when imported.
