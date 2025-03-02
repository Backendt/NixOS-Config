{ config, pkgs, ... }:

{
    imports = [
        ./desktop-hardware-configuration.nix
        ./base.nix
        ../../../modules/system/nvidia.nix
        ../../../modules/system/razer.nix
        ../../../modules/system/pipewire/desktop-pipewire.nix
    ];

    # Hostname (used in flake.nix !)
    networking.hostName = "nixos-desktop";

    # Enable wired network
    networking.networkmanager.enable = true;
}
